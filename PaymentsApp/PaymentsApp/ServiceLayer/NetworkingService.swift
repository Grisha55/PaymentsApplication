//
//  NetworkingService.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 02.07.2021.
//

import UIKit
import DynamicJSON

protocol NetworkingServiceProtocol {
    func getUserToken(vc: UIViewController, login: String, password: String, completion: @escaping (Result<String, Error>) -> Void)
    func getUserPayments(token: String, completion: @escaping (Result<[PaymentModel], Error>) -> Void)
}

class NetworkingService: NetworkingServiceProtocol {
    
    func getUserToken(vc: UIViewController, login: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        var components = URLComponents()
        components.scheme = SessionApp.shared.scheme
        components.host = SessionApp.shared.host
        components.path = "/api-test/login"
        
        guard let url = components.url else { return }
        
        let parameters = ["login" : login, "password" : password]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(SessionApp.shared.appKey, forHTTPHeaderField: "app-key")
        request.addValue(SessionApp.shared.v, forHTTPHeaderField: "v")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        
        request.httpBody = httpBody
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                guard let response = json["response"] as? [String: Any] else {
                    DispatchQueue.main.async {
                        Alerts().showAlert(vc: vc, message: "Неправильный логин или пароль")
                    }
                    return
                }
                guard let token = response["token"] as? String else { return }
                DispatchQueue.main.async {
                    completion(.success(token))
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getUserPayments(token: String, completion: @escaping (Result<[PaymentModel], Error>) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        var components = URLComponents()
        components.scheme = SessionApp.shared.scheme
        components.host = SessionApp.shared.host
        components.path = "/api-test/payments"
        components.queryItems = [
            URLQueryItem(name: "token", value: token)
        ]
        
        guard let url = components.url else { return }
        var request = URLRequest(url: url)
        request.addValue(SessionApp.shared.appKey, forHTTPHeaderField: "app-key")
        request.addValue(SessionApp.shared.v, forHTTPHeaderField: "v")
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            
            guard let items = JSON(data).response.array else { return }
            let payments: [PaymentModel] = items.map { PaymentModel(data: $0) }
            
            DispatchQueue.main.async {
                completion(.success(payments))
            }
        }
        task.resume()
    }
    
}
