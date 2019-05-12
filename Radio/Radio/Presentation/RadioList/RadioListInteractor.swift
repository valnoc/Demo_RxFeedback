//
//  RadioListInteractor.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 10/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift

protocol RadioListInteractor {
    func loadRadios() -> Observable<[Radio]>
}

class RadioListInteractorImpl: RadioListInteractor {
    
//    let loadRadiosUseCase: LoadRadiosUseCase
    
    
    func loadRadios() -> Observable<[Radio]> {
        return Observable.just([Radio(id: 0, title: "asd", imagePath: nil)])
    }
}
