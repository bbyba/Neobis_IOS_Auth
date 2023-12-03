//
//  RegisterViewController.swift
//  Neobis_IOS_auth
//

import UIKit

class RegisterViewController: UIViewController {
    
    lazy var registerView = RegisterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNav()
        view.addSubview(registerView)
        setupConstraintsRegisterView()
    }
    
    func setupConstraintsRegisterView(){
        registerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configureNav(){
        navigationItem.title = "Регистрация"
        navigationController?.navigationBar.tintColor = .black
    }

}
