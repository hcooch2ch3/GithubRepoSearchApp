//
//  SearchViewModel.swift
//  GithubRepoSearchApp
//
//  Created by 임성민 on 2022/12/10.
//

import Foundation
import RxSwift
import RxCocoa

/// 검색 키워드를 사용자에게 받아서 서버에 검색을 요청하고, 받은 결과를 갱신하는 역할
class SearchViewModel {
    private let searchService = SearchService()
    private let disposeBag = DisposeBag()
    let items = BehaviorRelay<[Item]>(value: [])
    private var keyword: String?
    private var page = 1
    
    func searchRepository(_ keyword: String, _ completionHandler: @escaping () -> Void) {
        items.accept([])
        self.keyword = keyword
        page = 1
        
        searchService.searchRepository(keyword, page)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] result in
                guard let self = self else { return }
                if let items = result.items {
                    self.items.accept(items)
                }
                completionHandler()
            }, onError: { error in
                print("error", error)
            })
            .disposed(by: disposeBag)
    }
    
    func fetchMoreRepositories() {
        guard let keyword = keyword else { return }
        page += 1
        
        searchService.searchRepository(keyword, page)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] result in
                guard let self = self else { return }
                let oldItems = self.items.value
                if let items = result.items {
                    self.items.accept(oldItems + items)
                }
            }, onError: { error in
                print("error", error)
            })
            .disposed(by: disposeBag)
    }
}
