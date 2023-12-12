//
//  RegisterUserRequest.swift
//  Neobis_IOS_auth
//

import Foundation

struct RegisterDto: Codable {
    let email: String
    let username: String
    let password: String
}

struct JwtRequest: Codable {
    let username: String
    let password: String
}

struct emailRequest: Codable {
    let email: String
}
