//
//  LoginView.swift
//  Neobis_IOS_auth
//

import UIKit
import SnapKit
import Foundation

class LoginView: UIView {

    lazy var globeImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "globe"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var welcomeBackLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back!"
//        label.font = .italicSystemFont(ofSize: 24)
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
        
    }()
    
    lazy var usernameTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Введи логин"
        
        return textfield
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "Введи Пароль"
        
        return textfield
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Bold", size: 16)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("У меня еще нет аккаунта", for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.setTitleColor(.black, for: .normal)
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        addSubview(globeImage)
        addSubview(welcomeBackLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(enterButton)
        addSubview(registerButton)
    }
    
    func setupConstraints(){
        globeImage.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(65)
            make.width.equalTo(186)
            make.height.equalTo(194)
        }
        
        welcomeBackLabel.snp.makeConstraints(){ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(globeImage.snp.bottom).offset(31)
        }
        
        usernameTextField.snp.makeConstraints(){ make in
            make.top.equalTo(welcomeBackLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints(){ make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        enterButton.snp.makeConstraints(){ make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints(){ make in
            make.top.equalTo(enterButton.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
