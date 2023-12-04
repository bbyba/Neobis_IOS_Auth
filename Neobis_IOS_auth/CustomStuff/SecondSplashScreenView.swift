//
//  SecondSplashScreenView.swift
//  Neobis_IOS_auth
//
//  Created by Burte Bayaraa on 2023.12.04.
//

import UIKit

class SecondSplashScreenView: UIView {
    
    lazy var titleView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "С возвращением!"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 40)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorby - Твой личный репетитор"
        label.font = UIFont(name: "MPLUS1p-Regular", size: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "readingOnTheWindow"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выйти", for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.setTitleColor(.black, for: .normal)
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        addSubview(titleView)
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        addSubview(logoImage)
        addSubview(logoutButton)
    }
    
    func setupConstraints() {
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(162)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(72)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(36)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(28)
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
            make.height.equalTo(315)
            make.width.equalTo(296)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(110)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
