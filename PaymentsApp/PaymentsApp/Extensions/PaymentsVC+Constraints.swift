//
//  Extension+Constraints.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 03.07.2021.
//

import UIKit

extension PaymentsVC {
    
    func setTableViewConstraints(tableView: UITableView) {
        tableView.translatesAutoresizingMaskIntoConstraints                        = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive           = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive     = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive   = true
    }
    
    
}
