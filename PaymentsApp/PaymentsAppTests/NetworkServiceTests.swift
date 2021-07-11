//
//  NetworkServiceTests.swift
//  PaymentsAppTests
//
//  Created by Григорий Виняр on 11.07.2021.
//

import XCTest
@testable import PaymentsApp

class NetworkServiceTests: XCTestCase {

    var authorizationVC: AuthorizationVC!
    var networkService: NetworkingService!
    
    override func setUpWithError() throws {
        authorizationVC = AuthorizationVC()
        networkService = NetworkingService()
    }

    override func tearDownWithError() throws {
        authorizationVC = nil
        networkService = nil
    }

    func testRequestForTokenNotNil() {
        
        // get
        let login = "demo"
        let password = "12345"
        let promise = expectation(description: #function)
        
        // when
        networkService.getUserToken(vc: authorizationVC, login: login, password: password) { (token) in
            if token == "" {
                XCTFail("The token is empty")
            } else {
                XCTAssertEqual(token, "123456789")
                promise.fulfill()
            }
        }
        
        // then
        wait(for: [promise], timeout: 5)
    }
    
    func testRequestForUserPaymentsNotNil() {
        
        // get
        let token = "123456789"
        let promise = expectation(description: #function)
        
        // when
        networkService.getUserPayments(token: token) { (result) in
            switch result {
            case .failure(_):
                XCTFail()
            case .success(let payments):
                XCTAssertNotNil(payments)
                promise.fulfill()
            }
        }
        
        // then
        waitForExpectations(timeout: 2) { (error) in
            if error != nil {
                XCTFail()
            }
        }
        
    }

}
