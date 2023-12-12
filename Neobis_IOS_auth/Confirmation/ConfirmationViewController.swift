//
//  ConfirmationViewController.swift
//  Neobis_IOS_auth
//
//

import UIKit

class ConfirmationViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let confirmationView = ConfirmationView()
    let email: String
    
    init(email: String) {
        self.email = email
        super.init(nibName: nil, bundle: nil)
        confirmationView.titleLabel.text = "Выслали письмо со ссылкой\nдля завершения регистрации\nна \(email)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNav()
        view.addSubview(confirmationView)
        setupConstraintsRegisterView()
        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
//        guard let email = registerView.emailTextField.text else {
//            print("Invalid input. Please check your data.")
//            return
//        }
        
        let emailRequest = emailRequest(email: email)
        let confirmationRequestViewModel = confirmationRequestViewModel()
        confirmationRequestViewModel.confirmationRequest(email: emailRequest)
        
        let resendAlertVC = ResendAlertViewController()
        resendAlertVC.modalPresentationStyle = .overCurrentContext
        present(resendAlertVC, animated: false, completion: nil)
    }
}
