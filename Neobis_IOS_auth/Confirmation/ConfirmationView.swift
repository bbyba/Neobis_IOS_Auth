//
//  ConfirmationView.swift
//  Neobis_IOS_auth
//

import UIKit

class ConfirmationView: UIView {
    
    lazy var titleView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выслали письмо со ссылкой для завершения регистрации на "
        label.font = UIFont(name: "MPLUS1p-Medium", size: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Если письмо не пришло, не спеши \n ждать совиную почту - лучше проверь \n ящик “Спам” \n\n\n (´｡• ω •｡`)
        """
        label.font = UIFont(name: "MPLUS1p-Regular", size: 16)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "sittingComputer"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var resendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Письмо не пришло", for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(logoImage)
        addSubview(resendButton)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(136)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(84)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(30)
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
            make.height.equalTo(231)
            make.width.equalTo(224)
        }
        
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
//            make.width.equalTo(224)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

