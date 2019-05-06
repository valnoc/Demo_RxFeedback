//
//  RadioListVC.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import UIKit
import RxSwift
import RxFeedback
import RxCocoa

class RadioListVC: UIViewController {

    // MARK: - deps
    let disposeBag = DisposeBag()
    let loadRadiosUseCase: LoadRadiosUseCase
    
    init(loadRadiosUseCase: LoadRadiosUseCase) {
        self.loadRadiosUseCase = loadRadiosUseCase
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life
    override func viewDidLoad() {
        super.viewDidLoad()

//        Driver.system(
//            initialState: State.empty,
//            reduce: State.reduce,
//            feedback:
//            // UI, user feedback
//            bindUI,
//            // NoUI, automatic feedback
//            react(request: { $0.loadNextPage }, effects: { resource in
//                return URLSession.shared.loadRepositories(resource: resource)
//                    .asSignal(onErrorJustReturn: .failure(.offline))
//                    .map(Event.response)
//            })
//            )
//            .drive()
//            .disposed(by: disposeBag)
    }
    
}
