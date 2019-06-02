//
//  RadioCoordinator.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 02/06/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

import Coordinator

public class RadioCoordinator: BaseCoordinator<VCFactory, CoordFactory, UINavigationController> {
    public func start() {
        let vc = vcFactory.makeMainVC()
        router.pushViewController(vc, animated: true)
    }
}
