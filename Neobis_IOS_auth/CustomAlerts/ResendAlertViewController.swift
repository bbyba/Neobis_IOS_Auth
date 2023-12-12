//
//  ResendAlertViewController.swift
//  Neobis_IOS_auth
//

import UIKit

class ResendAlertViewController: UIViewController {
    let resendAlertView = ResendAlertView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resendAlertView)
        setupConstraintsResendAlertView()
        addTargets()
    }
    
    private func setupConstraintsResendAlertView(){
        resendAlertView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addTargets(){
        resendAlertView.okayButton.addTarget(self, action: #selector(didTapOkayButton), for: .touchUpInside)
    }
    
    @objc func didTapOkayButton(){
        print("okay tapped")
        dismiss(animated: true, completion: nil)
    }
}
