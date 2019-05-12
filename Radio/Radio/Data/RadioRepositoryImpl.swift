//
//  RadioRepositoryImpl.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift

class RadioRepositoryImpl: RadioRepository {
    
    var i = 0
    func loadRadioList() -> Observable<[Radio]> {
        i += 1
        let radio = Radio(id: 0, title: "\(i)", imagePath: nil)
        return Observable
            .just([radio])
            .delaySubscription(RxTimeInterval(exactly: 5)!,
                               scheduler: MainScheduler.instance)
    }
}
