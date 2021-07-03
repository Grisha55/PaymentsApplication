//
//  PaymentModel.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 03.07.2021.
//

import Foundation
import DynamicJSON

class PaymentModel: Codable {
    var amount: Double?
    var created: Int?
    var currency: String?
    var desc: String?
    
    convenience required init(data: JSON) {
        self.init()
        
        self.amount = data.amount.double
        self.created = data.created.int
        self.currency = data.currency.string
        self.desc = data.desc.string
    }
}
