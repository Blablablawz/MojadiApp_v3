//
//  EditProfileController.swift
//  MojadiApp
//
//  Created by yoga arie on 11/04/22.
//

import UIKit

class EditProfileController: UIViewController {

    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = UIColor(hex: "16171D")
    }
    func setup(){
        title = "Edit Profile"
        nameTxtField.backgroundColor = UIColor(hex: "292934")
        passwordTxtField.backgroundColor = UIColor(hex: "292934")
        emailTxtField.backgroundColor = UIColor(hex: "292934")
        profileImage.image = UIImage(named: "edit")
        emailTxtField.attributedPlaceholder = NSAttributedString(
        string: " Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A1A1AA")])
    passwordTxtField.attributedPlaceholder = NSAttributedString(
        string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
        nameTxtField.attributedPlaceholder = NSAttributedString(
            string: "Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
        
    }

}

extension UIViewController {
    
    func showEditController(){
        let storyboard = UIStoryboard(name: "Edit", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "edit") as! EditProfileController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
