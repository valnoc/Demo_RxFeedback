//
//  AppAssembly.swift
//  JamMusic
//
//  Created by Valeriy Bezuglyy on 02/06/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import Swinject

import Radio

class AppAssembly {
    func register(in container: Container) {
        RadioAssembly().register(in: container)
        
        container.register(AppCoordinator.self) { (res) in
            AppCoordinator(coordinatorFactory: res.resolve(CoordinatorFactory.self)!)
        }
        
        container.register(CoordinatorFactory.self) { (res) in
            CoordinatorFactory(resolver: res)
        }
    }
}
