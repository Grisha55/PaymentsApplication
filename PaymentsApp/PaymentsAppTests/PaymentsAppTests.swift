//
//  PaymentsAppTests.swift
//  PaymentsAppTests
//
//  Created by Григорий Виняр on 11.07.2021.
//

import XCTest
@testable import PaymentsApp

class PaymentsAppTests: XCTestCase {
    
    var paymentVC: PaymentsVC!
    var networkingService: NetworkingService!
    
    override func setUpWithError() throws {
        
        paymentVC = PaymentsVC(token: "")
        networkingService = NetworkingService()
    }
    
    override func tearDownWithError() throws {
        paymentVC = nil
        networkingService = nil
    }
    
    func testIfPaymentsTokenIsEmpty() {
        XCTAssertNotNil(paymentVC.token)
    }
    
    func testGetDataToTableViewForValide() {
        
        paymentVC.getDataToTableView()
        
        networkingService.getUserPayments(token: paymentVC.token) { (result) in
            switch result {
            case .failure(_):
                XCTFail()
            case .success(let payments):
                XCTAssertNotNil(payments)
            }
        }
    }
}
