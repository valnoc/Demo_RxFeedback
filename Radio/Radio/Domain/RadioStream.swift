//
//  RadioStream.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

struct RadioStream: Codable {
    let path: String?
    
    enum CodingKeys: String, CodingKey {
        case path = "stream"
    }
}
