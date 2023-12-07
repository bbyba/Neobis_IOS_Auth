//
//  ConfirmationViewController.swift
//  Neobis_IOS_auth
//
//

import UIKit

class ConfirmationViewController: UIViewController, UIGestureRecognizerDelegate {
    let confirmationView = ConfirmationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNav()
        view.addSubview(confirmationView)
        setupConstraintsRegisterView()
        addTargets()
    }
    
    func setupConstraintsRegisterView(){
        confirmationView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configureNav(){
        navigationItem.title = "Registration"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "back"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func addTargets(){
        confirmationView.resendButton.addTarget(self, action: #selector(didTapResendButton), for: .touchUpInside)
    }

    @objc func popToPrevious(){
        navigationController?.popViewController(animated: true)
    }

    @objc func didTapResendButton() {
        print("resend button tapped.")
        let resendAlertVC = ResendAlertViewController()
        resendAlertVC.modalPresentationStyle = .overCurrentContext
        present(resendAlertVC, animated: false, completion: nil)
    }

}
