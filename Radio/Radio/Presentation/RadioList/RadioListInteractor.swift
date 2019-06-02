//
//  RadioListInteractor.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 10/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol RadioListInteractor {
    func loadRadios() -> Signal<[Radio]>
}

class RadioListInteractorImpl: RadioListInteractor {
    
    //MARK: - deps
    let loadRadiosUseCase: LoadRadiosUseCase
    
    init(loadRadiosUseCase: LoadRadiosUseCase) {
        self.loadRadiosUseCase = loadRadiosUseCase
    }
    
    func loadRadios() -> Signal<[Radio]> {
        return loadRadiosUseCase.execute()
            .asSignal(onErrorJustReturn: [])
            .map({ (radios) -> [Radio] in
                radios.sorted(by: { (a, b) -> Bool in
                    let aTitle = a.title ?? ""
                    let bTitle = b.title ?? ""
                    return aTitle < bTitle
                })
            })
    }
}
