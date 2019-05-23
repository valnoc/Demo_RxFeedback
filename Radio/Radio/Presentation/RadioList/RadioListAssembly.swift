//
//  RadioListAssembly.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 23/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import Swinject

class RadioListAssembly {
    func register(in container: Container) {
        container.register(RadioListInteractor.self) { (res) in
            RadioListInteractorImpl(loadRadiosUseCase: res.resolve(LoadRadiosUseCase.self)!)
        }
        
        container.register(RadioListVC.self) { (res) in
            RadioListVC(interactor: res.resolve(RadioListInteractor.self)!)
        }
    }
}
