//
//  PaymentsVC.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 02.07.2021.
//

import UIKit

class PaymentsVC: UIViewController {

    // MARK: - Properties
    private let tableView = UITableView()
    var token: String
    private var values: [[String : Any]]?
    
    init(token: String) {
        self.token = token
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService().getUserPayments(token: token) { [weak self] status in
            switch status {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let values):
                self?.values = values
                self?.tableView.reloadData()
            }
        }
        view.backgroundColor = UIColor.init(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        configureTableView()
        setTableViewConstraints()
        
        setupNavigationBar()
    }
    
    // MARK: - Methods
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.init(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        title = "Payments"
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(exitAction))
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc func exitAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.init(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        tableView.rowHeight = 200
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PaymentCell.self, forCellReuseIdentifier: PaymentCell.paymentCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints                        = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive           = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive     = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive   = true
    }

}


// MARK: - UITableViewDelegate
extension PaymentsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
}

// MARK: - UITableViewDataSource
extension PaymentsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let values = values else { return 0 }
        return values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentCell.paymentCell, for: indexPath) as? PaymentCell else { return UITableViewCell() }
        
        guard let values = values else { return UITableViewCell() }
        
        let value = values[indexPath.row]
        
        var createdStr = "N/A"
        var currencyStr = "No name"
        var descStr = "N/A"
        var amountStr = "N/A"
        
        if let created = value["created"], "\(created)" != "" {
            createdStr = "\(created)"
        }
        if let currency = value["currency"], "\(currency)" != "" {
            currencyStr = "\(currency)"
        }
        
        if let desc = value["desc"], "\(desc)" != "" {
            descStr = "\(desc)"
        }
        
        if let amount = value["amount"], "\(amount)" != "" {
            amountStr = "\(amount)"
        }
        
        cell.configureCell(created: createdStr, currency: currencyStr, desc: descStr, amount: amountStr)
        
        return cell
    }
}
