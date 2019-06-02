//
//  VCFactory.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

public class CoordFactory { }

public class VCFactory {
    func makeVC() -> UIViewController {
        let uc = LoadRadiosUseCase(radioRepo: RadioRepositoryImpl(urlSession: URLSession.shared))
        return RadioListVC(interactor: RadioListInteractorImpl(loadRadiosUseCase: uc))
    }
}
