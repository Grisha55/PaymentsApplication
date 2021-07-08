//
//  AuthorizationVC.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 02.07.2021.
//

import UIKit

class AuthorizationVC: UIViewController, HasCustomView {
    typealias CustomView = AuthorizationView
    
    override func loadView() {
        let customView = CustomView()
        customView.delegate = self
        view = customView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    // MARK: - Methods
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = nil
        navigationController?.navigationBar.tintColor = UIColor.init(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
    }
}

// MARK: - ButtonLogInDelegate
extension AuthorizationVC: ButtonLogInDelegate {
    
    func makeTouch(loginTF: UITextField, passwordTF: UITextField) {
        guard let login = loginTF.text, login != "" else {
            Alerts().showAlert(vc: self, message: "Заполните логин")
            return
        }
        guard let password = passwordTF.text, password != "" else {
            Alerts().showAlert(vc: self, message: "Заполните пароль")
            return
        }
        
        NetworkingService().getUserToken(vc: self, login: login, password: password, completion: { [weak self] token in
            
            guard let self = self else { return }
            if token != "" {
                let paymentsVC = PaymentsVC(token: token)
                paymentsVC.modalTransitionStyle = .crossDissolve
                paymentsVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(paymentsVC, animated: true)
            }
        })
    }
    
}
