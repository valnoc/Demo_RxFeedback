//
//  RadioListVC+Feedback.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 10/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift
import RxFeedback
import RxCocoa

extension RadioListVC {
    typealias Feedback = ((Driver<State>) -> Signal<Event>)
    
    func feedback() -> [Feedback] {
        return [bindUI(),
                reactToPullToRefresh()]
    }
    
    // MARK: - ui
    func bindUI() -> Feedback {
        let bindCell: (Int, Radio, UITableViewCell) -> () = { index, element, cell in
            cell.textLabel?.text =  element.title
        }
        
        return bind(self) { me, state in
            let subscriptions = [
                state.map({ $0.result })
                    .drive(me.myView.tableView.rx.items(cellIdentifier: "Cell"))(bindCell),

                state.map({ $0.isRefreshing })
                    .drive(me.myView.tableViewCtrl.refreshControl!.rx.isRefreshing),

                state.map({ $0.selectedRadio })
                    .do(onNext: { [weak me] in
                        guard let __self = me else { return }
                        guard let radio = $0 else { return }
                        __self.output?.didSelect(radio: radio)
                    })
            ]

            let events = [
                me.myView.tableViewCtrl.refreshControl!.rx
                    .controlEvent(.valueChanged)
                    .map({ Event.pullToRefresh }),

                me.myView.tableView.rx
                    .modelSelected(Radio.self)
                    .flatMapLatest({ Signal.just(Event.selectedRadio($0)) })
            ]
            
            return Bindings(subscriptions: subscriptions, events: events)
        }
    }
    
    // MARK: - react
    func reactToPullToRefresh() -> Feedback {
        return react(request: { (state: State) -> Bool? in
            return state.isRefreshing ? true : nil
            
        }, effects: { [weak self] (isRefreshing) in
            guard let sself = self else { return RadioListVC.nilSelfSignal() }
            return sself.interactor.loadRadios()
                .map({ Event.response($0) })
        })
    }

//    func reactToModelSelection() -> Feedback {
//        return react(request: { (state: State) -> Bool? in
//            return state.selectedRadio
//
//        }, effects: { [weak self] (isRefreshing) in
//            guard let sself = self else { return RadioListVC.nilSelfSignal() }
//            return sself.interactor.loadRadios()
//                .map({ Event.response($0) })
//        })
//    }
}
