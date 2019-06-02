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
    
    struct RepoResponse<T>: Codable where T: Codable {
        let results: T
    }
    
    func loadRadioList() -> Observable<[Radio]> {
        let builder = URLRequestBuilder(path: baseUrl + "/radios")
        builder.params = ["limit": 100,
                          "format": "json",
                          "client_id": clientId]
        return urlSession.rx
            .data(request: builder.make())
            .map({ (data) -> RepoResponse<[Radio]> in
                return try JSONDecoder().decode(RepoResponse<[Radio]>.self, from: data)
            })
            .map({ (response) -> [Radio] in
                response.results
            })
    }
    
    func loadRadioStream(radioId: Int) -> Observable<RadioStream> {
        let builder = URLRequestBuilder(path: baseUrl + "/radios/stream")
        builder.params = ["id": radioId,
                          "format": "json",
                          "client_id": clientId]
        return urlSession.rx
            .data(request: builder.make())
            .map({ (data) -> RepoResponse<[RadioStream]> in
                return try JSONDecoder().decode(RepoResponse<[RadioStream]>.self, from: data)
            })
            .map({ (response) -> RadioStream in
                //TODO: throw error
                return response.results.first ?? RadioStream(imagePath: nil, streamPath: nil)
            })
    }
    

}
