//
//  AuthorizationVC.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 02.07.2021.
//

import UIKit

class AuthorizationVC: UIViewController {

    // MARK: - Properties
    private let titleLabel = UILabel()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let authStackView = UIStackView()
    private let logInButton = UIButton()
    private var token: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureTitleLabel()
        configureLoginTF()
        configurePasswordTF()
        configureLogInButton()
        configureAuthStackView()
        
        setTitleLabelConstraints()
        setLoginTFConstraints()
        setPasswordTFConstraints()
        setLogInButtonConstraints()
        setAuthStackViewConstraints()
        
        setupNavigationBar()
    }
    
    // MARK: - Methods
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = nil
        navigationController?.navigationBar.tintColor = UIColor.init(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
    }
    
    private func configureLogInButton() {
        logInButton.setTitle("Войти", for: .normal)
        logInButton.setTitleColor(.black, for: .normal)
        logInButton.backgroundColor = .orange
        logInButton.layer.cornerRadius = 8.0
        logInButton.layer.borderWidth = 1.0
        logInButton.layer.borderColor = UIColor.black.cgColor
        logInButton.addTarget(self, action: #selector(buttonLogInAction), for: .touchUpInside)
    }
    
    @objc func buttonLogInAction() {
        guard let login = loginTextField.text, login != "" else {
            Alerts().showAlert(vc: self, message: "Заполните логин")
            return
        }
        guard let password = passwordTextField.text, password != "" else {
            Alerts().showAlert(vc: self, message: "Заполните пороль")
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
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Авторизация"
        titleLabel.font = titleLabel.font.withSize(55)
        titleLabel.textColor = .black
    }
    
    private func configureAuthStackView() {
        view.addSubview(authStackView)
        authStackView.axis = .vertical
        authStackView.alignment = .center
        authStackView.distribution = .fillEqually
        authStackView.spacing = 20
        
        authStackView.addArrangedSubview(loginTextField)
        authStackView.addArrangedSubview(passwordTextField)
        authStackView.addArrangedSubview(logInButton)
    }
    
    private func configureLoginTF() {
        loginTextField.placeholder = "Введите Логин"
        loginTextField.autocapitalizationType = .none
        loginTextField.layer.cornerRadius = 8.0
        loginTextField.layer.borderWidth = 1.0
        loginTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configurePasswordTF() {
        passwordTextField.placeholder = "Введите Пароль"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.layer.cornerRadius = 8.0
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setAuthStackViewConstraints() {
        authStackView.translatesAutoresizingMaskIntoConstraints                                       = false
        authStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                  = true
        authStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        authStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 150).isActive  = true
        authStackView.heightAnchor.constraint(equalToConstant: 200).isActive                          = true
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints                             = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive        = true
    }
    
    private func setLoginTFConstraints() {
        loginTextField.translatesAutoresizingMaskIntoConstraints                                 = false
        loginTextField.trailingAnchor.constraint(equalTo: authStackView.trailingAnchor).isActive = true
    }
    
    private func setPasswordTFConstraints() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints                                    = false
        passwordTextField.trailingAnchor.constraint(equalTo: authStackView.trailingAnchor).isActive    = true
    }
    
    private func setLogInButtonConstraints() {
        logInButton.translatesAutoresizingMaskIntoConstraints                                    = false
        logInButton.trailingAnchor.constraint(equalTo: authStackView.trailingAnchor).isActive    = true
    }

}
