//
//  LoadRadiosUseCase.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift

class LoadRadiosUseCase {
    let radioRepo: RadioRepository
    init(radioRepo: RadioRepository) {
        self.radioRepo = radioRepo
    }
    
    func execute() -> Observable<[Radio]> {
        return radioRepo.loadRadioList()
    }
}
