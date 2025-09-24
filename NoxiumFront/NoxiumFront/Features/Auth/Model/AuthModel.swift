//
//  AuthModel.swift
//  NoxiumFront
//
//  Created by Arnaud Hayon on 18/09/2025.
//

import Foundation

enum FieldType {
    case username
    case email
    case password
    case confirmPassword

    var placeholder: String {
        switch self {
        case .username:
            return "Username"
        case .email:
            return "Email"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm Password"
        }
    }

    var isSecure: Bool {
        switch self {
        case .password, .confirmPassword:
            return true
        default:
            return false
        }
    }
}
