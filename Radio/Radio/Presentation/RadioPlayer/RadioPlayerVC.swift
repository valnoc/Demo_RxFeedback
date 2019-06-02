//
//  RadioPlayerVC.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import UIKit
import RxSwift
import RxFeedback
import RxCocoa

class RadioPlayerVC: UIViewController {

    //MARK: - props
    let disposeBag = DisposeBag()
    var myView: RadioPlayerView { return view as! RadioPlayerView }
    
    // MARK: - deps
    let interactor: RadioPlayerInteractor
    
    init(interactor: RadioPlayerInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Driver
            .system(initialState: State.initial(),
                    reduce: reduce,
                    feedback: feedback())
            .drive()
            .disposed(by: disposeBag)
    }
    
    override func loadView() {
        super.loadView()
        view = RadioPlayerView()
    }
}
