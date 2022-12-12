//
//  SearchViewModel.swift
//  GithubRepoSearchApp
//
//  Created by 임성민 on 2022/12/10.
//

import Foundation
import RxSwift

/// 검색 키워드를 사용자에게 받아서 서버에 검색을 요청하고, 받은 결과를 갱신하는 역할
class SearchViewModel {
    private let searchService = SearchService()
    private let disposeBag = DisposeBag()
    var searchResult = PublishSubject<SearchResult>()
    
    func searchRepository(_ keyword: String, _ completionHandler: @escaping () -> Void) {
        let emptySearchResult = SearchResult(totalCount: nil, incompleteResults: nil, items: [])
        self.searchResult.onNext(emptySearchResult)
        
        searchService.searchRepository(keyword)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { result in
                self.searchResult.onNext(result)
                completionHandler()
            }, onError: { error in
                print("error", error)
            })
            .disposed(by: disposeBag)
    }
}
