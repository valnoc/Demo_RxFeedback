//
//  AppCoordinator.swift
//  JamMusic
//
//  Created by Valeriy Bezuglyy on 23/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import Coordinator

import Radio

class AppCoordinator: BaseAppCoordinator<CoordinatorFactory> {
    
    func start() {
        let navCtrl = UINavigationController()
        router.rootViewController = navCtrl
        
        let coord = coordinatorFactory.makeRadioCoordinator(navCtrl: navCtrl)
        storage.add(coord)
        coord.start()
    }
}
