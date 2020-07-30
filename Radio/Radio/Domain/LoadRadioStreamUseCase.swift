//
//  LoadRadioStreamUseCase.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift

class LoadRadioStreamUseCase {
    let radioRepo: RadioRepository
    init(radioRepo: RadioRepository) {
        self.radioRepo = radioRepo
    }
    
    func execute(radioId: Int) -> Observable<RadioStream> {
        return radioRepo.loadRadioStream(radioId: radioId)
    }
}
