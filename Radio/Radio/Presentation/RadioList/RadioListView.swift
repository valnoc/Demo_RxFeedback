//
//  RadioListView.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 10/05/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import UIKit

class RadioListView: UIView {
    
    let tableViewCtrl: UITableViewController
    var tableView: UITableView { return tableViewCtrl.tableView }
    
    init() {
        tableViewCtrl = UITableViewController(style: .plain)
        tableViewCtrl.refreshControl = UIRefreshControl(frame: .zero)
        super.init(frame: .zero)
        
        addSubview(tableViewCtrl.tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableViewCtrl.tableView.frame = bounds
    }
}
