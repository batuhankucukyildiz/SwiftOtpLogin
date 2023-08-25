//
//  User.swift
//  SwiftOtpLogin
//
//  Created by Batuhan Küçükyıldız on 25.08.2023.
//

import Foundation

struct User {
    var username : String
    var password : String
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
