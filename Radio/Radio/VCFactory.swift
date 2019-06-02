//
//  VCFactory.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import Swinject

public class CoordFactory { }

public class VCFactory {
    let resolver: Resolver
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeListVC() -> RadioListVC {
        return resolver.resolve(RadioListVC.self)!
    }
}
