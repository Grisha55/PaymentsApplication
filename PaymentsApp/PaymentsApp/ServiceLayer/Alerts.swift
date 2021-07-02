//
//  Alerts.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 02.07.2021.
//

import UIKit

class Alerts {
    
    func showAlert(vc: UIViewController, message: String) {
        let alert = UIAlertController(title: "Ошибка авторизации", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
