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
        case radioChanged(_ radio: Radio)
        case streamLoaded(_ stream: RadioStream)
        case playerstart
    }
    
    static func nilSelfSignal() -> Signal<Event> {
        return Signal.just(Event.radioChanged(Radio(id: nil, title: nil, imagePath: nil)))
    }
    
    struct State {
        var radio: Radio?
        var stream: RadioStream?
        
        static func initial() -> State {
            return State(radio: nil, stream: nil)
        }
    }
    
    func reduce(state: State, event: Event) -> State {
        switch event {
        case .radioChanged(let radio):
            var newState = state
            newState.radio = radio
            newState.stream = nil
            return newState
            
        case .streamLoaded(let stream):
            var newState = state
            newState.stream = stream
            return newState
            
        case .playerstart:
            return state
        }
    }
}
