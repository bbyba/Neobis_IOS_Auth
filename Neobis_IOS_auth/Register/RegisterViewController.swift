//
//  RegisterViewController.swift
//  Neobis_IOS_auth
//

import UIKit

class RegisterViewController: UIViewController, UIGestureRecognizerDelegate {
    
    lazy var registerView = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNav()
        view.addSubview(registerView)
        setupConstraintsRegisterView()
        addTargets()
    }
    
    func setupConstraintsRegisterView(){
        registerView.snp.makeConstraints { make in
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
        registerView.createPasswordTextField.addTarget(self, action: #selector(createPassword), for: .editingChanged)
        registerView.confirmPasswordTextField.addTarget(self, action: #selector(confirmPassword), for: .editingChanged)
        registerView.nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    }

    @objc func popToPrevious(){
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Check password regex
    
    @objc func createPassword() {
        if let password = registerView.createPasswordTextField.text {
            isValidPassword(password)
        }
    }
    
    func isValidPassword(_ password: String) -> Bool {
        updateRequirementLabel(registerView.firstPasswordRequirement, hasRequirement: hasValidLength(password))
        updateRequirementLabel(registerView.secondPasswordRequirement, hasRequirement: hasLetters(password))
        updateRequirementLabel(registerView.thirdPasswordRequirement, hasRequirement: hasDigit(password))
        updateRequirementLabel(registerView.fourthPasswordRequirement, hasRequirement: hasSpecialCharacter(password))
        
        let allRequirementsMet = hasLetters(password) && hasDigit(password) && hasSpecialCharacter(password) && hasValidLength(password)
        
        registerView.createPasswordTextField.textColor = allRequirementsMet ? .black : .systemRed

        return allRequirementsMet
    }
    
    func updateRequirementLabel(_ label: UILabel, hasRequirement: Bool) {
        var labelText = label.text ?? ""
        labelText = String(labelText.dropLast())
        
        if hasRequirement {
            labelText += "✅"
            label.textColor = .systemGreen
        } else {
            labelText += "❌"
            label.textColor = .systemRed
        }
        
        label.text = labelText
    }
    
    func hasValidLength(_ password: String) -> Bool {
        let length = password.count
        let minLength = 8
        let maxLength = 15
        
        return length >= minLength && length <= maxLength
    }
    
    func hasLetters(_ password: String) -> Bool {
        let lowercaseLetterRegex = ".*[a-z]+.*"
        let uppercaseLetterRegex = ".*[A-Z]+.*"
        
        let lowercaseLetterPredicate = NSPredicate(format: "SELF MATCHES %@", lowercaseLetterRegex)
        let uppercaseLetterPredicate = NSPredicate(format: "SELF MATCHES %@", uppercaseLetterRegex)
        
        return lowercaseLetterPredicate.evaluate(with: password) && uppercaseLetterPredicate.evaluate(with: password)
    }
    
    func hasDigit(_ password: String) -> Bool {
        let digitRegex = ".*\\d+.*"
        let digitPredicate = NSPredicate(format: "SELF MATCHES %@",digitRegex)
        
        return digitPredicate.evaluate(with: password)
    }
    
    func hasSpecialCharacter(_ password: String) -> Bool {
        let specialCharacterRegex = ".*[@$!%*?&]+.*"
        let specialCharacterPredicate = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex)
        
        return specialCharacterPredicate.evaluate(with: password)
    }
    
    
    //MARK: - Confirm Password

    @objc func confirmPassword() -> Bool {
        let originalPass = registerView.createPasswordTextField.text
        let checkPass = registerView.confirmPasswordTextField.text

        if checkPass == originalPass {
            registerView.confirmPasswordTextField.textColor = .black
            registerView.mismatchPasswordLabel.isHidden = true
            return true
        } else {
            registerView.confirmPasswordTextField.textColor = .systemRed
            registerView.mismatchPasswordLabel.isHidden = false
            return false
        }
    }
    
    //MARK: - Next button
    
//    func checkRequirementsForNextButton() {
//        let email = registerView.emailTextField.text
//        let username = registerView.usernameTextField.text
//        let isValidPass = isValidPassword(registerView.createPasswordTextField.text ?? "")
//        let doPasswordsMatch = confirmPassword()
//
//        if !(email?.isEmpty ?? true) && !(username?.isEmpty ?? true) && isValidPass && doPasswordsMatch {
//            registerView.nextButton.isEnabled = true
//            registerView.nextButton.backgroundColor = .black
//        } else {
//            registerView.nextButton.isEnabled = false
//        }
//    }
    
    @objc func didTapNextButton() {
        print("Next button tapped")
        let confirmationVC = ConfirmationViewController()
        navigationController?.pushViewController(confirmationVC, animated: true)
    }

}
