//
//  RadioPlayerVC+Feedback.swift
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
    typealias Feedback = ((Driver<State>) -> Signal<Event>)
    
    func feedback() -> [Feedback] {
        return [bindUI(),
                reactRadioChange()]
    }
    
    // MARK: - ui
    func bindUI() -> Feedback {
        return bind(self) { me, state in
            let subscriptions = [
                state.map({ $0.radio?.title ?? "" }).drive(me.navigationItem.rx.title)
            ]

            let events = [
                me.input
                    .asSignal(onErrorJustReturn: .signalError)
                    .map({ $0 })
            ]

            return Bindings(subscriptions: subscriptions, events: events)
        }
    }

    // MARK: - react
    func reactRadioChange() -> Feedback {
        return react(request: { (state: State) -> Int? in
            return state.radio?.id
            
        }, effects: { [weak self] (radioId) in
            guard let sself = self else { return RadioPlayerVC.nilSelfSignal() }
            return sself.interactor.loadStream(radioId: radioId)
                .asSignal(onErrorJustReturn: RadioStream(path: nil))
                .map({ Event.streamLoaded($0) })
        })
    }
    
    func reactStreamChange() -> Feedback {
        return react(request: { (state: State) -> URL? in
            guard let path = state.streamPath else { return nil }
            return URL(string: path)
            
        }, effects: { [weak self] (url) in
            guard let sself = self else { return RadioPlayerVC.nilSelfSignal() }
            sself.player.play(url: url)
            return Signal.just(Event.playerstart) //TODO: remove this event
        })
    }

//    func reactNowPlayingChange() -> Feedback {
//        return react(request: { (state: State) -> URL? in
//            return state.nowPlaying
//
//        }, effects: { [weak self] (nowPlaying) in
//            guard let sself = self else { return RadioPlayerVC.nilSelfSignal() }
//            //TODO: reload at the end of song
//            //TODO: if error or nothing changed - reload every 10 seconds
//            return Signal.just(Event.playerstart) //TODO: remove this event
//        })
//    }

}
