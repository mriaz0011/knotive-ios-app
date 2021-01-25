//
//  GetStartedModel.swift
//  Knotive
//
//  Created by Muhammad Riaz on 06/01/2021.
//

import Foundation

struct GetStartedModel {
    
    static var isTesting: Bool = false
    static var anyAddedAccounts: Bool = false
    
    struct LoginVC {
        
        static var email: String = ""
        static var password: String = ""
    }
    
    struct RegistrationVC {
        
        static var email: String = ""
        static var password: String = ""
        static var repeatPassword: String = ""
        static var age: Int = 0
    }
    
    struct SetDetails {
        
        static var firstName: String = ""
        static var lastName: String = ""
        static var gender: String = ""
    }
}
