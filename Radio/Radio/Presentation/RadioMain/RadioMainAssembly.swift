//
//  RadioMainAssembly.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 23/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import Swinject

class RadioMainAssembly {
    func register(in container: Container) {
        container.register(RadioMainVC.self) { (res) in
            RadioMainVC(playerVC: res.resolve(RadioPlayerVC.self)!,
                        listVC: res.resolve(RadioListVC.self)!)
        }
    }
}
