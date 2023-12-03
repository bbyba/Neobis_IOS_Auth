//
//  RegisterViewController.swift
//  Neobis_IOS_auth
//

import UIKit

class RegisterViewController: UIViewController {
//    lazy var bothLetterKindsExists = true
//    lazy var numberExists = true
//    lazy var specialCharacterExists = true
//    lazy var hasValidLength = true
    
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
        navigationItem.title = "Регистрация"
        navigationController?.navigationBar.tintColor = .black
    }
    
    func addTargets(){
        registerView.createPasswordTextField.addTarget(self, action: #selector(createPasswordChanged), for: .editingChanged)
    }
    
    @objc func createPasswordChanged() {
            if let password = registerView.createPasswordTextField.text {
                isValidPassword(password)
            }
        }

    func isValidPassword(_ password: String) {
        updateRequirementLabel(registerView.firstPasswordRequirement, hasRequirement: hasValidLength(password))
        updateRequirementLabel(registerView.secondPasswordRequirement, hasRequirement: hasLetters(password))
        updateRequirementLabel(registerView.thirdPasswordRequirement, hasRequirement: hasDigit(password))
        updateRequirementLabel(registerView.fourthPasswordRequirement, hasRequirement: hasSpecialCharacter(password))

        let allRequirementsMet = hasLetters(password) && hasDigit(password) && hasSpecialCharacter(password) && hasValidLength(password)

        registerView.createPasswordTextField.textColor = allRequirementsMet ? .black : .systemRed
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
}
