//
//  ButtonLoginDelegateTests.swift
//  PaymentsAppTests
//
//  Created by Григорий Виняр on 11.07.2021.
//

import XCTest
@testable import PaymentsApp

class AuthorizationVCTests: XCTestCase {

    var authorizationVC: AuthorizationVC!
    
    override func setUpWithError() throws {
        authorizationVC = AuthorizationVC()
    }

    override func tearDownWithError() throws {
        authorizationVC = nil
    }
    
    func testMakeTouchMethodForValide() {
        
        // get
        let loginTF = UITextField()
        let passwordTF = UITextField()
        loginTF.text = "demo"
        passwordTF.text = "12345"
        
        // when
        authorizationVC.makeTouch(loginTF: loginTF, passwordTF: passwordTF)
        
        // then
        XCTAssertTrue(loginTF.hasText)
        XCTAssertTrue(passwordTF.hasText)
    }

}
