//
//  ViewController.swift
//  Neobis_IOS_auth
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginView)
        setupConstraintsMainView()
        setupTargets()
    }
    
    func setupConstraintsMainView(){
        loginView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupTargets() {
        loginView.loginButton.addTarget(self, action: #selector(didTapLoginButon), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    @objc func didTapLoginButon(){
        print("login button tapped")
        
//        // Check if all requirements are met before proceeding
//        guard let username = loginView.usernameTextField.text,
//                let password = loginView.passwordTextField.text,
//        else {
//            print("Invalid input. Please check your data.")
//            return
//        }
//
//        // Create a RegisterDto object with the entered data
//        let JwtRequest = JwtRequest(username: username, password: password)
//
//        // Use the RegisterViewModel to handle the registration process
//        let loginViewModel = LoginViewModel()
//        loginViewModel.login(user: JwtRequest)
        
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen
        present(profileVC, animated: false, completion: nil)
    }
    
    @objc func didTapRegisterButton() {
        print("register button tapped")
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }


}

