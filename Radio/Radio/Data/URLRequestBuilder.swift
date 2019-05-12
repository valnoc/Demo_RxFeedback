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
    
    init(path: String) {
        self.path = path
    }
    
    func make() -> URLRequest {
        return URLRequest(url: URL(string: path)!)
    }
}
