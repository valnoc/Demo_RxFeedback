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
        case signalError
        case radioChanged(_ radio: Radio)
        case streamLoaded(_ stream: RadioStream)
        case playerstart
    }
    
    static func nilSelfSignal() -> Signal<Event> {
        return Signal.just(Event.signalError)
    }
    
    struct State {
        var radio: Radio?
        var stream: RadioStream?
        
        static func initial() -> State {
            return State(radio: nil, stream: nil)
        }
    }
    
    func reduce(state: State, event: Event) -> State {
        var newState = state

        switch event {
        case .radioChanged(let radio):
            newState.radio = radio
            newState.stream = nil

        case .streamLoaded(let stream):
            newState.stream = stream

        case .playerstart, .signalError:
            break
        }

        return newState
    }
}
