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
    private let backView = UIView()
    static let paymentCell = "paymentCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.init(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        addSubview(backView)
        
        configureBackView()
        configureCurrencyLabel()
        configureCreatedLabel()
        configureDescLabel()
        configureAmountLabel()
        configureStackView()
        
        setBackViewConstraints()
        setStackViewConstraints()
        setCreateLabelConstraints()
        setCurrancyLabelConstraints()
        setDescLabelConstraints()
        setAmountLabelConstraints()
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
    
    private func configureBackView() {
        backView.addSubview(stackView)
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 8.0
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        
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
        descLabel.numberOfLines = 0
    }
    
    private func configureAmountLabel() {
        amountLabel.textColor = .black
    }
    
    private func setBackViewConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive            = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive     = true
        backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive    = true
    }
    
    private func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints                                       = false
        stackView.topAnchor.constraint(equalTo: backView.topAnchor).isActive                      = true
        stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor).isActive                = true
        stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive            = true
        stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 5).isActive = true
    }
    
    private func setCreateLabelConstraints() {
        createdLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        createdLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setCurrancyLabelConstraints() {
        currencyLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        currencyLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setDescLabelConstraints() {
        descLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        descLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setAmountLabelConstraints() {
        amountLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        amountLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        createdLabel.text = nil
        currencyLabel.text = nil
        descLabel.text = nil
        amountLabel.text = nil
    }
    
}
