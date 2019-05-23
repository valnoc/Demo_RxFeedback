//
//  URLRequestBuilder.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 12/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

class URLRequestBuilder {
    var path: String
    var params: [String: AnyHashable]?
    
    init(path: String) {
        self.path = path
    }
    
    func make() -> URLRequest {
        var components = URLComponents(string: path)!
        if let params = params {
            components.queryItems = params.map({ URLQueryItem(name: $0.0, value: "\($0.1)")})
        }
        return URLRequest(url: components.url!)
    }
}
