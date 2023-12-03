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
        loginView.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    }
    
    @objc func registerPressed() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }


}

