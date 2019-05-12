//
//  RadioRepositoryImpl.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift

class RadioRepositoryImpl: RadioRepository {
    
    // MARK: - props
    let baseUrl = "https://api.jamendo.com/v3.0"
    
    // MARK: - deps
    let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    struct WrongJSONError: Error {}
    func loadRadioList() -> Observable<[Radio]> {
        let builder = URLRequestBuilder(path: baseUrl + "/radios")
        builder.params = ["format": "json",
                          "limit": 100,
                          "client_id": ""]
        return urlSession.rx
            .data(request: builder.make())
            .map({ (data) -> RepoResponse<[Radio]> in
                return try JSONDecoder().decode(RepoResponse<[Radio]>.self, from: data)
            })
            .map({ (response) -> [Radio] in
                response.results
            })
        
        
//        i += 1
//        let radio = Radio(id: 0, title: "\(i)", imagePath: nil)
//        return Observable
//            .just([radio])
//            .delaySubscription(RxTimeInterval(exactly: 5)!,
//                               scheduler: MainScheduler.instance)
    }
    
    struct RepoResponse<T>: Codable where T: Codable {
        let results: T
    }
}
