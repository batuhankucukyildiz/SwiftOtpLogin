//
//  UserViewModel.swift
//  SwiftOtpLogin
//
//  Created by Batuhan Küçükyıldız on 25.08.2023.
//

import Foundation

class LoginViewModel{
    private let user : User
    
    init(username : String , password : String) {
        user = User(username: username, password: password)
    }
    
    func login(completion: @escaping (Bool) -> Void)  {
        // Login View Simulation
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let isValid = (self.user.username == "Batuhan" && self.user.password == "123")
                completion(isValid)
            }
        }
}
