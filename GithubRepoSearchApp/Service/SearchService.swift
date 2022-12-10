//
//  SearchService.swift
//  GithubRepoSearchApp
//
//  Created by 임성민 on 2022/12/11.
//

import Foundation
import Alamofire
import RxSwift

class SearchService {
    func searchRepository(_ keyword: String) -> Observable<SearchResult> {
        return Observable<SearchResult>.create { observer in
            let url = "https://api.github.com/search/repositories"
            let parameters = ["q": keyword]
            let request = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseDecodable(of: SearchResult.self) { response in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(data)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
