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
    private let dataSource = ObjectDataSource()
    
    init(token: String) {
        self.token = token
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataToTableView()
        view.backgroundColor = UIColor.init(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        configureTableView()
        setTableViewConstraints(tableView: tableView)
        setupNavigationBar()
    }
    
    // MARK: - Methods
    func getDataToTableView() {
        NetworkingService().getUserPayments(token: token) { [weak self] status in
            switch status {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let payments):
                self?.dataSource.payments = payments
                self?.tableView.reloadData()
            }
        }
    }
    
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
        tableView.dataSource = dataSource
        tableView.register(PaymentCell.self, forCellReuseIdentifier: PaymentCell.paymentCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func makeAnimationForCells(cell: UITableViewCell) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }

}

// MARK: - UITableViewDelegate
extension PaymentsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        makeAnimationForCells(cell: cell)
    }
}
