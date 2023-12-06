//
//  RegisterView.swift
//  Neobis_IOS_auth
//

import UIKit

class RegisterView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create an account \n Lorby"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
        
    }()
    
    lazy var emailTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Email address"
        
        return textfield
    }()
    
    lazy var usernameTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "New Username"
        
        return textfield
    }()
    
    lazy var createPasswordTextField: PasswordTextField = {
        let textfield = PasswordTextField()
        textfield.placeholder = "Create a new password"
        
        return textfield
    }()
    
    
    lazy var firstPasswordRequirement: UILabel = {
        let label = UILabel()
        label.text = " · 8-15 characters "
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    lazy var secondPasswordRequirement: UILabel = {
        let label = UILabel()
        label.text = " · Capital and lowercase letters "
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    lazy var thirdPasswordRequirement: UILabel = {
        let label = UILabel()
        label.text = " · Min. 1 number "
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    lazy var fourthPasswordRequirement: UILabel = {
        let label = UILabel()
        label.text =  " · Min. 1 special character "
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    lazy var confirmPasswordTextField: PasswordTextField = {
        let textfield = PasswordTextField()
        textfield.placeholder = "Confirm Password"
        
        return textfield
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemRed, for: .disabled)
        button.layer.cornerRadius = 16
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Bold", size: 16)
        button.isEnabled = false
        
        return button
    }()
    
    lazy var mismatchPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Passwords do not match"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemRed
        label.isHidden = true
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(usernameTextField)
        addSubview(createPasswordTextField)
        addSubview(firstPasswordRequirement)
        addSubview(secondPasswordRequirement)
        addSubview(thirdPasswordRequirement)
        addSubview(fourthPasswordRequirement)
        addSubview(confirmPasswordTextField)
        addSubview(nextButton)
        addSubview(mismatchPasswordLabel)
    }
    
    func setupConstraints(){
        titleLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
        
        emailTextField.snp.makeConstraints(){ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        usernameTextField.snp.makeConstraints(){ make in
            make.top.equalTo(emailTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        createPasswordTextField.snp.makeConstraints(){ make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        firstPasswordRequirement.snp.makeConstraints(){ make in
            make.top.equalTo(createPasswordTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        secondPasswordRequirement.snp.makeConstraints(){ make in
            make.top.equalTo(firstPasswordRequirement.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        thirdPasswordRequirement.snp.makeConstraints(){ make in
            make.top.equalTo(secondPasswordRequirement.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        fourthPasswordRequirement.snp.makeConstraints(){ make in
            make.top.equalTo(thirdPasswordRequirement.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        confirmPasswordTextField.snp.makeConstraints(){ make in
            make.top.equalTo(fourthPasswordRequirement.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        nextButton.snp.makeConstraints(){ make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        mismatchPasswordLabel.snp.makeConstraints() { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(15)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
