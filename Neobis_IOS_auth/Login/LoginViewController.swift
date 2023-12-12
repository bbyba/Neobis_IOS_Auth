//
//  ViewController.swift
//  Neobis_IOS_auth
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    lazy var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginView)
        setupConstraintsMainView()
        addTargets()
    }
    
    func setupConstraintsMainView(){
        loginView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func addTargets() {
        loginView.loginButton.addTarget(self, action: #selector(didTapLoginButon), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    @objc func didTapLoginButon(){
        print("login button tapped")
        
        guard let username = loginView.usernameTextField.text,
              let password = loginView.passwordTextField.text
        else {
            print("Invalid input. Please check your data.")
            return
        }

        let loginViewModel = LoginViewModel()
        loginViewModel.login(username: username, password: password)

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

