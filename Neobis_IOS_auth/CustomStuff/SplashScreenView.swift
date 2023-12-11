//
//  SplashScreenView.swift
//  Neobis_IOS_auth
//

import UIKit

class SplashScreenView: UIView {
    
    lazy var titleView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorby"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 40)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Personal tutor"
        label.font = UIFont(name: "MPLUS1p-Regular", size: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "readingOnTheWindow"))
        image.contentMode = .scaleAspectFit
        
        return image
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
    }
    
    func setupConstraints() {
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(162)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(59)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
