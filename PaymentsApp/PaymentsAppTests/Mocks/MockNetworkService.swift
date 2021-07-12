//
//  MockNetworkService.swift
//  PaymentsAppTests
//
//  Created by Григорий Виняр on 12.07.2021.
//

import UIKit
@testable import PaymentsApp

class MockNetworkService {
    
    var shouldReturnError = false
    var loginWasCalled = false
    var requestPaymentsWasCalled = false
    
    enum MockServiceError: Error {
        case login
        case requestPayments
    }
    
    func reset() {
        shouldReturnError = false
        loginWasCalled = false
        requestPaymentsWasCalled = false
    }
    
    convenience init() {
        self.init(false)
    }
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    let mockTokenResponse: String = "12345"
    
    let mockPaymentsResponse = [
        PaymentModel(amount: 100.0, created: 1, currency: "Dollar", desc: "Some"),
        PaymentModel(amount: 10.0, created: 2, currency: "Euro", desc: "Non")
    ]
    
}

extension MockNetworkService: NetworkingServiceProtocol {
    
    func getUserToken(vc: UIViewController, login: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        loginWasCalled = true
        
        if shouldReturnError {
            completion(.failure(MockServiceError.login))
        } else {
            completion(.success(mockTokenResponse))
        }
    }
    
    func getUserPayments(token: String, completion: @escaping (Result<[PaymentModel], Error>) -> Void) {
        requestPaymentsWasCalled = true
        
        if shouldReturnError {
            completion(.failure(MockServiceError.requestPayments))
        } else {
            completion(.success(mockPaymentsResponse))
        }
    }
    
}
