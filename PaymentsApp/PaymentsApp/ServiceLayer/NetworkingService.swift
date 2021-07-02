//
//  NetworkingService.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 02.07.2021.
//

import Foundation

class NetworkingService {
    
    func getUserToken(login: String, password: String) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        var components = URLComponents()
        components.scheme = "http"
        components.host = "82.202.204.94"
        components.path = "/api-test/login"
        
        guard let url = components.url else { return }
        
        let parameters = ["login" : login, "password" : password]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("12345", forHTTPHeaderField: "app-key")
        request.addValue("1", forHTTPHeaderField: "v")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        
        request.httpBody = httpBody
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            
            guard let data = data else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                guard let response = json["response"] as? [String: Any] else { return }
                guard let token = response["token"] as? String else { return }
                SessionApp.shared.token = token
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getUserPayments(token: String, completion: @escaping (Result<[[String : Any]], Error>) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        var components = URLComponents()
        components.scheme = "http"
        components.host = "82.202.204.94"
        components.path = "/api-test/payments"
        components.queryItems = [
            URLQueryItem(name: "token", value: token)
        ]
        
        guard let url = components.url else { return }
        var request = URLRequest(url: url)
        request.addValue("12345", forHTTPHeaderField: "app-key")
        request.addValue("1", forHTTPHeaderField: "v")
        
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
                guard let values = json["response"] as? [[String : Any]] else { return }
                DispatchQueue.main.async {
                    completion(.success(values))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
