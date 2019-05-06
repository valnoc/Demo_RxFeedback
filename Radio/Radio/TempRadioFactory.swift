//
//  TempRadioFactory.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

public class TempRadioFactory {
    public init() {}
    
    public func makeVC() -> UIViewController {
        return RadioListVC(loadRadiosUseCase:
            LoadRadiosUseCase(radioRepo: RadioRepositoryImpl()))
    }
}
