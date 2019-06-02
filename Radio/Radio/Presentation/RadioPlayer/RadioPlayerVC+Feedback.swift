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
                reactRefreshing()]
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
                    .drive(me.myView.tableViewCtrl.refreshControl!.rx.isRefreshing)
            ]
            
            let events = [
                me.myView.tableViewCtrl.refreshControl!.rx
                    .controlEvent(.valueChanged)
                    .map({Event.pullToRefresh})
            ]
            
            return Bindings(subscriptions: subscriptions, events: events)
        }
    }
    
    // MARK: - react
    func reactRefreshing() -> Feedback {
        return react(request: { (state: State) -> Bool? in
            return state.isRefreshing ? true : nil
            
        }, effects: { [weak self] (isRefreshing) in
            print(isRefreshing)
            guard let sself = self else { return RadioPlayerVC.nilSelfSignal() }
            return sself.interactor.loadRadios()
                .map({ Event.response($0) })
        })
    }
    

}
