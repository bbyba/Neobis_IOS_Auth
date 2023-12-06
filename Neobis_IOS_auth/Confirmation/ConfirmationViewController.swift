//
//  ConfirmationViewController.swift
//  Neobis_IOS_auth
//
//

import UIKit

class ConfirmationViewController: UIViewController {
    let splashScreen = SplashScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        configureNav()
        view.addSubview(splashScreen)
        setupConstraintsRegisterView()
//        addTargets()
    }
    
    func setupConstraintsRegisterView(){
        splashScreen.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
