//
//  LoginViewModel.swift
//  Neobis_IOS_auth
//

import Foundation

protocol LoginViewModelProtocol {
    func login(user: JwtRequest)
}

class LoginViewModel: LoginViewModelProtocol {
    
    private let apiService: APIService
    private let endpoint = "/api/auth"
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func login(user: JwtRequest) {
        apiService.post(endpoint: endpoint, data: user) { (result) in
            switch result {
            case .success(_):
                print("success")
            case .failure(let error):
                print(error)
            }
        }
    }
}
