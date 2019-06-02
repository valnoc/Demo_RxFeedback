//
//  CoordinatorFactory.swift
//  JamMusic
//
//  Created by Valeriy Bezuglyy on 02/06/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import Swinject

import Radio

class CoordinatorFactory {
    let resolver: Resolver
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeAppCoordinator() -> AppCoordinator {
        return resolver.resolve(AppCoordinator.self)!
    }
    
    func makeRadioCoordinator() -> RadioCoordinator {
        return resolver.resolve(RadioCoordinator.self)!
    }
}
