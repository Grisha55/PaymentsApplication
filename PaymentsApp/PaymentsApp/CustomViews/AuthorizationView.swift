//
//  AuthorizationView.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 06.07.2021.
//

import UIKit

protocol ButtonLogInDelegate {
    func makeTouch(loginTF: UITextField, passwordTF: UITextField)
}

class AuthorizationView: UIView {
    
    // MARK: - Subviews
    private let authStackView = UIStackView()
    private let titleLabel = UILabel()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let logInButton = UIButton()
    var delegate: ButtonLogInDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        createSubviews()
    }
    
    // MARK: - Methods
    
    @objc func buttonLogInTapped() {
        delegate?.makeTouch(loginTF: loginTextField, passwordTF: passwordTextField)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.loginTextField.text = ""
            self?.passwordTextField.text = ""
        }
        
    }
    
    func setupUI() {
        // Setup ui for logInButton
        logInButton.setTitle("Войти", for: .normal)
        logInButton.setTitleColor(.black, for: .normal)
        logInButton.backgroundColor = .orange
        logInButton.layer.cornerRadius = 8.0
        logInButton.layer.borderWidth = 1.0
        logInButton.layer.borderColor = UIColor.black.cgColor
        logInButton.addTarget(self, action: #selector(buttonLogInTapped), for: .touchUpInside)
        
        // Setup ui for titleLabel
        titleLabel.text = "Авторизация"
        titleLabel.font = titleLabel.font.withSize(55)
        titleLabel.textColor = .black
        
        // Setup ui for authStackView
        authStackView.axis = .vertical
        authStackView.alignment = .center
        authStackView.distribution = .fillEqually
        authStackView.spacing = 20
        
        authStackView.addArrangedSubview(loginTextField)
        authStackView.addArrangedSubview(passwordTextField)
        authStackView.addArrangedSubview(logInButton)
        
        // Setup ui for loginTextField
        loginTextField.placeholder = "Введите Логин"
        loginTextField.autocapitalizationType = .none
        loginTextField.layer.cornerRadius = 8.0
        loginTextField.layer.borderWidth = 1.0
        loginTextField.layer.borderColor = UIColor.black.cgColor
        
        // Setup ui for passwordTextField
        passwordTextField.placeholder = "Введите Пароль"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.layer.cornerRadius = 8.0
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func createSubviews() {
        
        // Adding to view
        addSubview(authStackView)
        addSubview(titleLabel)
        
        // Setup authStackView
        authStackView.translatesAutoresizingMaskIntoConstraints                                       = false
        authStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                  = true
        authStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        authStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 150).isActive  = true
        authStackView.heightAnchor.constraint(equalToConstant: 200).isActive                          = true
        
        // Setup titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints                             = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive        = true
        
        // Setup loginTextField
        loginTextField.translatesAutoresizingMaskIntoConstraints                                 = false
        loginTextField.trailingAnchor.constraint(equalTo: authStackView.trailingAnchor).isActive = true
        
        // Setup passwordTextField
        passwordTextField.translatesAutoresizingMaskIntoConstraints                                  = false
        passwordTextField.trailingAnchor.constraint(equalTo: authStackView.trailingAnchor).isActive  = true
        
        // Setup logInButton
        logInButton.translatesAutoresizingMaskIntoConstraints                                 = false
        logInButton.trailingAnchor.constraint(equalTo: authStackView.trailingAnchor).isActive = true
    }
    
}
