//
//  RadioListVC+State.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 10/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

extension RadioListVC {
    enum Event {
        case pullToRefresh
        case response
    }
    
    struct State {
        var isRefreshing: Bool
        var result: [Radio]
        
        static func initial() -> State {
            return State(isRefreshing: true, result: [])
        }
    }
    
    func reduce(state: State, event: Event) -> State {
        switch event {
        case .pullToRefresh:
            var newState = state
            newState.isRefreshing = true
            return newState
            
        case .response:
            var newState = state
            newState.isRefreshing = false
            return newState
        }
    }
}
