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
        return []
    }
    
    // MARK: - ui
    
    // MARK: - react
    func reactRadioChange() -> Feedback {
        return react(request: { (state: State) -> Radio? in
            return state.radio
            
        }, effects: { [weak self] (radio) in
            guard let sself = self else { return RadioPlayerVC.nilSelfSignal() }
            return sself.interactor.loadStream(radioId: radio.id ?? -1)
                .asSignal(onErrorJustReturn: RadioStream(imagePath: nil, streamPath: nil))
                .map({ Event.streamLoaded($0) })
        })
    }

}
