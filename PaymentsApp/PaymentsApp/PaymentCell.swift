//
//  PaymentCell.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 02.07.2021.
//

import UIKit

class PaymentCell: UITableViewCell {

    // MARK: - Properties
    private let createdLabel = UILabel()
    private let currencyLabel = UILabel()
    private let descLabel = UILabel()
    private let amountLabel = UILabel()
    private let stackView = UIStackView()
    static let paymentCell = "paymentCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackView)
        
        configureCurrencyLabel()
        configureCreatedLabel()
        configureDescLabel()
        configureAmountLabel()
        configureStackView()
        
        setStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configureCell(created: String, currency: String, desc: String, amount: String) {
        self.createdLabel.text = "Created: \(created)"
        self.currencyLabel.text = "Currency: \(currency)"
        self.descLabel.text = "Desc: \(desc)"
        self.amountLabel.text = "Amount: \(amount)"
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        
        stackView.addArrangedSubview(createdLabel)
        stackView.addArrangedSubview(currencyLabel)
        stackView.addArrangedSubview(descLabel)
        stackView.addArrangedSubview(amountLabel)
    }
    
    private func configureCreatedLabel() {
        createdLabel.textColor = .black
    }
    
    private func configureCurrencyLabel() {
        currencyLabel.textColor = .black
    }
    
    private func configureDescLabel() {
        descLabel.textColor = .black
    }
    
    private func configureAmountLabel() {
        amountLabel.textColor = .black
    }
    
    private func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints                   = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive           = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive     = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive   = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        createdLabel.text = nil
        currencyLabel.text = nil
        descLabel.text = nil
        amountLabel.text = nil
    }
    
}
