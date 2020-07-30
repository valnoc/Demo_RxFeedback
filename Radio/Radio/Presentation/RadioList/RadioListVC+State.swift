//
//  RadioListVC+State.swift
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
    enum Event {
        case pullToRefresh
        case response(_ radios: [Radio])
        case selectedRadio(_ radio: Radio)
    }
    
    static func nilSelfSignal() -> Signal<Event> {
        return Signal.just(Event.response([]))
    }
    
    struct State {
        var isRefreshing: Bool
        var result: [Radio]
        var selectedRadio: Radio?
        
        static func initial() -> State {
            return State(isRefreshing: true, result: [], selectedRadio: nil)
        }
    }
    
    func reduce(state: State, event: Event) -> State {
        var newState = state

        switch event {
        case .pullToRefresh:
            newState.isRefreshing = true

        case .response(let radios):
            newState.isRefreshing = false
            newState.result = radios

        case .selectedRadio(let radio):
            newState.selectedRadio = radio
        }

        return newState
    }
}
