//
//  AlertsTests.swift
//  PaymentsAppTests
//
//  Created by Григорий Виняр on 11.07.2021.
//

import XCTest
@testable import PaymentsApp

class MockAlerts: AlertsProtocol {
    func showAlert(vc: UIViewController, message: String) {
        let alert = UIAlertController(title: "Ошибка авторизации", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
    
}

class AlertsTests: XCTestCase {

    var mockAlerts: AlertsProtocol!
    
    override func setUpWithError() throws {
        mockAlerts = Alerts()
    }

    override func tearDownWithError() throws {
        mockAlerts = nil
    }

    func testShowAlertMethodForValide() {
        
        // get
        let vc = UIViewController()
        let message = "Some random message"
        
        // when
        mockAlerts.showAlert(vc: vc, message: message)
        
        // then
        XCTAssertNotNil(vc)
    }

}
