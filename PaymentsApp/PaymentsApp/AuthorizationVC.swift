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
    }
    
    // MARK: - Methods
    private func configureLogInButton() {
        logInButton.setTitle("LOG IN", for: .normal)
        logInButton.setTitleColor(.black, for: .normal)
        logInButton.backgroundColor = .orange
        logInButton.layer.cornerRadius = 8.0
        logInButton.layer.borderWidth = 1.0
        logInButton.layer.borderColor = UIColor.black.cgColor
        logInButton.addTarget(self, action: #selector(buttonLogInAction), for: .touchUpInside)
    }
    
    @objc func buttonLogInAction() {
        NetworkingService().getUserToken(login: loginTextField.text!, password: passwordTextField.text!, completion: { [weak self] token in
            guard let self = self else { return }
            if token != "" {
                let paymentsVC = PaymentsVC(token: token)
                paymentsVC.modalTransitionStyle = .crossDissolve
                paymentsVC.modalPresentationStyle = .fullScreen
                self.present(paymentsVC, animated: true, completion: nil)
            }
        })
        
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Authorization"
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
        loginTextField.placeholder = "Enter your Login"
        loginTextField.autocapitalizationType = .none
        loginTextField.layer.cornerRadius = 8.0
        loginTextField.layer.borderWidth = 1.0
        loginTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configurePasswordTF() {
        passwordTextField.placeholder = "Enter your Password"
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
