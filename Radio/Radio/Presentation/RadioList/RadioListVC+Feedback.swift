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
        let radio = Radio(id: 0, title: "asd", imagePath: nil)
        return react(request: { (state: State) -> NSNumber? in
            if state.isRefreshing { return NSNumber(value: state.isRefreshing) }
            else { return nil }
        },
                     effects: { (_) in
                        //                return sself.interactor.loadRadios()
                        //                    .asSignal(onErrorJustReturn: [])
                        //                    .map(Event.response)
                        return Variable([radio])
                            .asObservable()
                            .asSignal(onErrorJustReturn: [])
                            .map({ _ in Event.response })
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
