//
//  RegisterView.swift
//  Neobis_IOS_auth
//

import UIKit

class RegisterView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Создать аккаунт \n Lorby"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
        
    }()
    
    lazy var emailTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Введи адрес почты"
        
        return textfield
    }()
    
    lazy var usernameTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Придумай логин"
        
        return textfield
    }()
    
    lazy var createPasswordTextField: PasswordTextField = {
        let textfield = PasswordTextField()
        textfield.placeholder = "Создай пароль"
        
        return textfield
    }()
    
    
    lazy var firstPasswordRequirement: UILabel = {
        let label = UILabel()
        label.text = " · От 8 до 15 символов"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    lazy var secondPasswordRequirement: UILabel = {
        let label = UILabel()
        label.text = " · Строчные и прописные буквы"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    lazy var thirdPasswordRequirement: UILabel = {
        let label = UILabel()
        label.text = " · Минимум 1 цифра"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    lazy var fourthPasswordRequirement: UILabel = {
        let label = UILabel()
        label.text = " · Минимум 1 спецсимвол (!, \", #, $...)"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    lazy var confirmPasswordTextField: PasswordTextField = {
        let textfield = PasswordTextField()
        textfield.placeholder = "Повтори пароль"
        
        return textfield
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Bold", size: 16)
        
        return button
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
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
