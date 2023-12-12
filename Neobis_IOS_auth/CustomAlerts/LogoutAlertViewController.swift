//
//  LogoutAlertViewController.swift
//  Neobis_IOS_auth
//

import UIKit

class LogoutAlertViewController: UIViewController {
    let logoutAlertView = LogoutAlertView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoutAlertView)
        setupConstraintsLogoutAlertView()
        addTargets()
    }
    
    private func setupConstraintsLogoutAlertView(){
        logoutAlertView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addTargets(){
        logoutAlertView.yesLogoutButton.addTarget(self, action: #selector(didTapYesLogoutButton), for: .touchUpInside)
        logoutAlertView.stayButton.addTarget(self, action: #selector(didTapStayButton), for: .touchUpInside)
    }
    
    @objc func didTapYesLogoutButton(){
        print("Alert-Logout Button tapped")
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func didTapStayButton(){
        print("Stay tapped")
        dismiss(animated: true, completion: nil)
    }
}
