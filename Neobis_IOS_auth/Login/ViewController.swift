//
//  ViewController.swift
//  Neobis_IOS_auth
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
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

