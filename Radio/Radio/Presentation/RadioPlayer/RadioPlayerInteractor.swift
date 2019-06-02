//
//  RadioPlayerInteractor.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 10/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift

protocol RadioPlayerInteractor {
    func loadStream(radioId: Int) -> Observable<RadioStream>
}

class RadioPlayerInteractorImpl: RadioPlayerInteractor {
    
    //MARK: - deps
    let loadRadioStreamUseCase: LoadRadioStreamUseCase
    
    init(loadRadioStreamUseCase: LoadRadioStreamUseCase) {
        self.loadRadioStreamUseCase = loadRadioStreamUseCase
    }
    
    func loadStream(radioId: Int) -> Observable<RadioStream> {
        return loadRadioStreamUseCase.execute(radioId: radioId)
    }
}
