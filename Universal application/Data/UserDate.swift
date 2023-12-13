//
//  UserDate.swift
//  Universal application
//
//  Created by Дима Кожемякин on 13.12.2023.
//

import Foundation

class UserManager: ObservableObject {
    @Published var user = User()
}

struct User: Codable {
    var userName = ""
    var userPassword = ""
    var isRegistred = false
    
}
