//
//  RadioAssembly.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 23/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import Swinject

public class RadioAssembly {
    public init() { }
    
    public func register(in container: Container) {
        RadioListAssembly().register(in: container)
        
        container.register(URLSession.self) { (res) in
            URLSession.shared
        }
        
        container.register(RadioRepository.self) { (res) in
            RadioRepositoryImpl(urlSession: res.resolve(URLSession.self)!)
        }
        
        container.register(LoadRadiosUseCase.self) { (res) in
            LoadRadiosUseCase(radioRepo: res.resolve(RadioRepository.self)!)
        }
        
        container.register(RadioCoordinator.self) { (res, navCtrl) in
            RadioCoordinator(vcFactory: res.resolve(VCFactory.self)!,
                             coordinatorFactory: CoordFactory(),
                             router: navCtrl)
        }
        
        container.register(VCFactory.self) { (res) in
            VCFactory(resolver: res)
        }
    }
}
