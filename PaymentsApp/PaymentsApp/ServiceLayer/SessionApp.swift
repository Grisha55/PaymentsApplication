//
//  SessionApp.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 02.07.2021.
//

import Foundation

final class SessionApp {
    
    static var shared = SessionApp()
    
    var token: String?
    
    private init() {}
}
