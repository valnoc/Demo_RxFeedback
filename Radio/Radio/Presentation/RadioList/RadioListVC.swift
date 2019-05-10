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

    //MARK: - props
    let disposeBag = DisposeBag()
    
    // MARK: - deps
    let interactor: RadioListInteractor
    
    init(interactor: RadioListInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life
    override func viewDidLoad() {
        super.viewDidLoad()

        Driver.system(
            initialState: State.initial(),
            reduce: reduce,
            feedback:
            // UI, user feedback
//            bindUI,
            // NoUI, automatic feedback
            react(request: { $0.isLoading },
                  effects: { [weak self] resource in
//                return sself.interactor.loadRadios()
//                    .asSignal(onErrorJustReturn: [])
//                    .map(Event.response)
                    return Variable([Radio(id: 0, title: "asd", imagePath: nil)])
                        .asObservable()
                        .asSignal(onErrorJustReturn: [])
                        .map(Event.response)
            })
            )
            .drive()
            .disposed(by: disposeBag)
    }
    
//    func bindUI() -> Signal<Event> {
//        let subscriptions = [
//            state.map { $0.search }.drive(me.searchText!.rx.text),
//            state.map { $0.lastError?.displayMessage }.drive(me.status!.rx.textOrHide),
//            state.map { $0.results }.drive(searchResults.rx.items)(configureCell),
//
//            state.map { $0.loadNextPage?.description }.drive(me.loadNextPage!.rx.textOrHide),
//        ]
//
//        let events: [Signal<Event>] = [
//            me.searchText!.rx.text.orEmpty.changed.asSignal().map(Event.searchChanged),
//            triggerLoadNextPage(state)
//        ]
//
//        return Bindings(subscriptions: subscriptions, events: events)
//    }
}
