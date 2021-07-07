//
//  ObjectDataSource.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 07.07.2021.
//

import UIKit

class ObjectDataSource: NSObject, UITableViewDataSource {
    
    var payments = [PaymentModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentCell.paymentCell, for: indexPath) as? PaymentCell else { return UITableViewCell() }
        
        let payment = payments[indexPath.row]
        
        var amount = payment.amount
        var created = payment.created
        var currency = payment.currency
        var desc = payment.desc
        
        if String(amount ?? 0) == "" || amount == nil {
            amount = 0
        }
        
        if String(created ?? 0) == "" || created == nil {
            created = 0
        }
        
        if currency == "" || currency == nil {
            currency = "No name"
        }
        
        if desc == "" || desc == nil {
            desc = "000"
        }
        
        cell.configureCell(created: String(created ?? 0), currency: currency ?? "", desc: desc ?? "", amount: String(amount ?? 0))
        
        return cell
    }
}
