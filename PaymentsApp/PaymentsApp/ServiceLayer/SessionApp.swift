//
//  SessionApp.swift
//  PaymentsApp
//
//  Created by Григорий Виняр on 02.07.2021.
//

import Foundation

final class SessionApp {
    
    static var shared = SessionApp()
    
    let scheme = "http"
    let host = "82.202.204.94"
    let v = "1"
    let appKey = "12345"
    
    private init() {}
}
