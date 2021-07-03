//
//  PaymentCell+Constraints.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 03.07.2021.
//

import UIKit

extension PaymentCell {
    
    func setBackViewConstraints(backView: UIView) {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive            = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive     = true
        backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive    = true
    }
    
    func setStackViewConstraints(stackView: UIStackView, backView: UIView) {
        stackView.translatesAutoresizingMaskIntoConstraints                                       = false
        stackView.topAnchor.constraint(equalTo: backView.topAnchor).isActive                      = true
        stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor).isActive                = true
        stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive            = true
        stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 5).isActive = true
    }
    
    func setCreateLabelConstraints(createdLabel: UILabel, stackView: UIStackView) {
        createdLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        createdLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true
    }
    
    func setCurrancyLabelConstraints(currencyLabel: UILabel, stackView: UIStackView) {
        currencyLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        currencyLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true
    }
    
    func setDescLabelConstraints(descLabel: UILabel, stackView: UIStackView) {
        descLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        descLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true
    }
    
    func setAmountLabelConstraints(amountLabel: UILabel, stackView: UIStackView) {
        amountLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        amountLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true
    }
}
