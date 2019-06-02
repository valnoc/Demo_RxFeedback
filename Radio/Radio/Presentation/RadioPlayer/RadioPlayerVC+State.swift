//
//  RadioPlayerVC+State.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 10/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import RxSwift
import RxFeedback
import RxCocoa

extension RadioPlayerVC {
    enum Event {
        case selectedRadio(_ radio: Radio)
    }
    
    static func nilSelfSignal() -> Signal<Event> {
        return Signal.just(Event.selectedRadio(Radio(id: nil, title: nil, imagePath: nil)))
    }
    
    struct State {
        var currentRadio: Radio?
        
        static func initial() -> State {
            return State(currentRadio: nil)
        }
    }
    
    func reduce(state: State, event: Event) -> State {
        switch event {
        case .selectedRadio(let radio):
            var newState = state
            newState.currentRadio = radio
            return newState
        }
    }
}
