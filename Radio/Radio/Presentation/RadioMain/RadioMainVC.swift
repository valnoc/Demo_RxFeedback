//
//  RadioMainVC.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 06/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import UIKit

class RadioMainVC: UIViewController {

    //MARK: - props
    
    // MARK: - deps
    let playerVC: RadioPlayerVC
    let listVC: UIViewController
    
    init(playerVC: RadioPlayerVC,
         listVC: UIViewController) {
        self.playerVC = playerVC
        self.listVC = listVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let playerView = playerVC.view,
            let listView = listVC.view else { return }
        
        playerView.translatesAutoresizingMaskIntoConstraints = false
        listView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(playerView)
        view.addSubview(listView)
        
        [
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            playerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            playerView.bottomAnchor.constraint(equalTo: listView.topAnchor),
            
            listView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listView.leftAnchor.constraint(equalTo: view.leftAnchor),
            listView.rightAnchor.constraint(equalTo: view.rightAnchor),
            listView.heightAnchor.constraint(equalToConstant: 100)
        ]
            .forEach({ $0.isActive = true })

//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
//            self?.playerVC.play(radio: Radio(id: 1, title: "qweqwe", imagePath: nil))
//        }
    }
}
