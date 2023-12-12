//
//  ProfileViewController.swift
//  Neobis_IOS_auth
//


import UIKit

class ProfileViewController: UIViewController {
    lazy var profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        configureNav()
        view.addSubview(profileView)
        setupConstraintsRegisterView()
        addTargets()
    }
    
    func setupConstraintsRegisterView(){
        profileView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func addTargets() {
        profileView.logoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
    }
    
    @objc func didTapLogoutButton(){
        print("Logout button tapped")
        
        let logoutAlertVC = LogoutAlertViewController()
        logoutAlertVC.modalPresentationStyle = .overFullScreen
        navigationController?.pushViewController(logoutAlertVC, animated: false)
    
        
    }
}
