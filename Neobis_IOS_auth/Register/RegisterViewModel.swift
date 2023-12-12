//
//  RegisterViewModel.swift
//  Neobis_IOS_auth
//

import Foundation

protocol RegisterViewModelProtocol {
    func register(user: RegisterDto)
}

protocol confirmationRequestProtocol {
    func confirmationRequest(email: emailRequest)
}

class RegisterViewModel: RegisterViewModelProtocol {
    
    private let apiService: APIService
    private let endpoint = "/api/register"
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func register(user: RegisterDto) {
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

class confirmationRequestViewModel: confirmationRequestProtocol {

    private let apiService: APIService
    private let endpoint = "/api/resendEmail"
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func confirmationRequest(email: emailRequest) {
        let userEmail = email.email
        
        apiService.get(endpoint: endpoint, email: userEmail) { (result) in
            switch result {
            case .success(_):
                print("success")
            case .failure(let error):
                print(error)
            }
        }
    }
}


//    func confirmationRequest(email: String) {
//        apiService.get(endpoint: endpoint, email: email) { (result) in
//            switch result {
//            case .success(_):
//                print("success")
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
