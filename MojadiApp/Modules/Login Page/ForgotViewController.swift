//
//  ForgotViewController.swift
//  Login
//
//  Created by yoga arie on 07/10/21.
//

import UIKit

class ForgotViewController: UIViewController {

    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var email: String?
   
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let emailImage = UIImage(named:"mail")
        addLeftImageTo(txtField: emailTextField, andImage: emailImage!)
        
        let passwordImage = UIImage(named: "password")
        addLeftImageTo(txtField: passwordTextField, andImage: passwordImage!)
        
        let nameImage = UIImage(named: "name")
        addLeftImageTo(txtField: nameTextField, andImage: nameImage!)
        
        let confirmImage = UIImage(named: "password")
        addLeftImageTo(txtField: confirmTextField, andImage: confirmImage!)
        view.backgroundColor = .black
        print("1. viewDidLoad")

        // Do any additional setup after loading the view.
        emailTextField.text = email
        emailTextField.attributedPlaceholder = NSAttributedString(
        string: " Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A1A1AA")])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(
        string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
      
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
        
        confirmTextField.attributedPlaceholder = NSAttributedString(
            string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
            }
    
    
        // Mark: - Actions
   // @IBAction func closeButtonTapped(_ sender: Any) {
    //    dismiss(animated: true, completion: nil)
   // }
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 5.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
        
    }
    func isValid() -> Bool {
        guard let name = nameTextField.text, name.count >= 3  else{
            print("Name is not valid")
          
            return false
            
            
        }
        guard let email = emailTextField.text, email.isValidEmail else{
            print("Email is not valid")
            return false
           
         }
        guard let password = passwordTextField.text, password.isPasswordValid else{
            print("Password is not valid")
            return false
           
         }
        guard let confirmPassword = confirmTextField.text, confirmPassword.isPasswordValid else{
            print("Password is not valid")
            return false
           
         }
        
        
        return true
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        if isValid(){
            navigationController?.popViewController(animated: true)
        } else {
            
        }
    }
    @IBAction func alreadyRegister(_ sender: Any) {
       
            navigationController?.popViewController(animated: true)
       
}
}

// Mark: - Extensions
extension UIViewController {
    
    func showForgotViewController(email: String? = nil){
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "forgot") as! ForgotViewController
        viewController.email = email
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
