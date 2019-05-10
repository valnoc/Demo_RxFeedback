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
    func reactRefreshing() -> ((Driver<State>) -> Signal<Event>) {
        return react(request: { (state: State) -> NSNumber? in
            return state.isRefreshing ? NSNumber(value: state.isRefreshing): nil
        }, effects: { [weak self] (_) in
            guard let sself = self else { return RadioListVC.nilSelfSignal() }
            return sself.interactor.loadRadios()
                .asSignal(onErrorJustReturn: [])
                .map({ Event.response($0) })
        })
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
