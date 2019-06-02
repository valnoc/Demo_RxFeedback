//
//  RadioPlayerAssembly.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 23/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import Swinject

class RadioPlayerAssembly {
    func register(in container: Container) {
        container.register(RadioPlayerInteractor.self) { (res) in
            RadioPlayerInteractorImpl(loadRadiosUseCase: res.resolve(LoadRadiosUseCase.self)!)
        }
        
        container.register(RadioPlayerVC.self) { (res) in
            RadioPlayerVC(interactor: res.resolve(RadioPlayerInteractor.self)!)
        }
    }
}
