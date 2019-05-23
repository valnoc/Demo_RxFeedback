//
//  Radio.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

struct Radio: Codable {
    let id: Int?
    let title: String?
    let imagePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "dispname"
        case imagePath = "image"
    }
}
