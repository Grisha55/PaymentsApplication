//
//  AuthorizationVC+Constraints.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 03.07.2021.
//

import UIKit

extension AuthorizationVC {
    
    func setAuthStackViewConstraints(authStackView: UIStackView, titleLabel: UILabel) {
        authStackView.translatesAutoresizingMaskIntoConstraints                                       = false
        authStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                  = true
        authStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        authStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 150).isActive  = true
        authStackView.heightAnchor.constraint(equalToConstant: 200).isActive                          = true
    }
    
    func setTitleLabelConstraints(titleLabel: UILabel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints                             = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive        = true
    }
    
    func setLoginTFConstraints(loginTextField: UITextField, authStackView: UIStackView) {
        loginTextField.translatesAutoresizingMaskIntoConstraints                                 = false
        loginTextField.trailingAnchor.constraint(equalTo: authStackView.trailingAnchor).isActive = true
    }
    
    func setPasswordTFConstraints(passwordTextField: UITextField, authStackView: UIStackView) {
        passwordTextField.translatesAutoresizingMaskIntoConstraints                                  = false
        passwordTextField.trailingAnchor.constraint(equalTo: authStackView.trailingAnchor).isActive  = true
    }
    
    func setLogInButtonConstraints(logInButton: UIButton, authStackView: UIStackView) {
        logInButton.translatesAutoresizingMaskIntoConstraints                                 = false
        logInButton.trailingAnchor.constraint(equalTo: authStackView.trailingAnchor).isActive = true
    }
}
