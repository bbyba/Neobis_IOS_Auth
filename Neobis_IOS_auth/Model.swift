//
//  RegisterUserRequest.swift
//  Neobis_IOS_auth
//

import Foundation

struct RegisterDto: Codable {
    let email: String
    let firstName: String
    let password: String
}

struct JwtRequest: Codable {
    let username: String
    let password: String
}
