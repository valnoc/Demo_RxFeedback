//
//  RadioRepository.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift

protocol RadioRepository {
    func loadRadioList() -> Observable<[Radio]>
}
