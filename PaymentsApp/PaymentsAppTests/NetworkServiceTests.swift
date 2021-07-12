//
//  NetworkServiceTests.swift
//  PaymentsAppTests
//
//  Created by Григорий Виняр on 11.07.2021.
//

import XCTest
@testable import PaymentsApp

class NetworkServiceTests: XCTestCase {

    var mockNetworkService: MockNetworkService!
    
    override func setUpWithError() throws {
        mockNetworkService = MockNetworkService()
    }

    override func tearDownWithError() throws {
        mockNetworkService = nil
    }
    
    func testGettionUserTokenRequest() {
        
        // get
        let vc = UIViewController()
        let login = "demo"
        let password = "12345"
        
        // when
        mockNetworkService.getUserToken(vc: vc, login: login, password: password) { (result) in
            switch result {
            case .failure(_):
                XCTFail()
            case .success(let token):
                XCTAssertNotEqual(token, "")
            }
        }
        
        // then
        XCTAssertEqual(login, "demo")
        XCTAssertEqual(password, "12345")
    }
    
    func testGettingUserPaymentsRequest() {
        
        // get
        let token = "123456789"
        
        // when
        mockNetworkService.getUserPayments(token: token) { (result) in
            switch result {
            case .failure(_):
                XCTFail()
            case .success(let payments):
                XCTAssertNotNil(payments)
            }
        }
        
        // then
        XCTAssertEqual(token, "123456789")
    }
}
