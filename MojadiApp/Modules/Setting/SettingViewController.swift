//
//  SettingViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 11/04/22.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        containerView.addSubview(button)
        self.button = button
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        button.tintColor = UIColor(hex: "A1A1AA")
        button.setTitle(nil, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        
        ])
        button.addTarget(self, action: #selector(self.languageButtonTapped(_:)), for: .touchUpInside)
    
        
        
        view.backgroundColor = UIColor(hex: "16171D")
      title = "Settings"
    }
 
    @objc func languageButtonTapped(_ sender: Any){
        showLanguageViewController()
    }
   

}

extension UIViewController {
    
    func showSettingController(){
        let storyboard = UIStoryboard(name: "Setting", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "setting") as! SettingViewController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}

//
//        let moreButton = UIButton(type: .system)
//        contentView.addSubview(moreButton)
//        contentStackView.addArrangedSubview(moreButton)
//        self.moreButton = moreButton
//        moreButton.tintColor = .white
//        moreButton.setImage(UIImage(named: "threedot"), for: .normal)
//        moreButton.setTitle(nil, for: .normal)
//        moreButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            moreButton.widthAnchor.constraint(equalToConstant: 24),
//            moreButton.heightAnchor.constraint(equalToConstant: 24)
