//
//  LoginViewController.swift
//  MojadiPro
//
//  Created by yoga arie on 21/03/22.
//


import UIKit

class LoginViewController: UIViewController {
 
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let emailImage = UIImage(named:"mail")
        addLeftImageTo(txtField: emailTextField, andImage: emailImage!)
        
        let passwordImage = UIImage(named: "password")
        addLeftImageTo(txtField: passwordTextField, andImage: passwordImage!)
        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        view.backgroundColor = .black
//        let button = UIButton(type: .system)
//        button.setTitle("Register", for: .normal)
//        button.setTitleColor(UIColor.black, for: .normal)
//        button.addTarget(self, action: #selector(registerButtonTapped(_:)), for: UIControl.Event.touchUpInside)
//        view.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 20),
//            button.centerXAnchor.constraint(equalTo: cardView.centerXAnchor, constant: 0)
            emailTextField.attributedPlaceholder = NSAttributedString(
            string: " Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A1A1AA")])
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "A1A1AA")])
    }
    
    // MARK: - Actions
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 5.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
        
    }
    
    
    @objc func registerButtonTapped(_ sender: Any){
        print("Register")
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        let validation = validate()
        if validation.isValid {
            login()
        }
        else {
            let alert = UIAlertController(title: "Error", message: validation.message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func forgotButtonTapped(_ sender: Any) {
        showForgotViewController(email: emailTextField.text)
        
        
    }
    
    
    
    
    // MARK: - Helpers
    
    func validate() -> (isValid: Bool, message: String) {
        
        guard let email = emailTextField.text, !email.isEmpty else {
            return (false, "Email tidak boleh kosong")
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            return (false, "Password tidak boleh kosong")
        }
        
        return (true, "")
    }
    
    func login() {
        view.endEditing(true)
        
        UserDefaults.standard.set(true, forKey: "isLogin")
        UserDefaults.standard.synchronize()
        navigateToHome()
        
        
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
            
        case passwordTextField:
            textField.resignFirstResponder()
            login()
            
        default:
            break
        }
        
        return false
    }
}

//MARK: - Extensioins
extension UIViewController{
    func navigateToLogin() {
    let storyboard = UIStoryboard(name: "Login", bundle: nil) //Akses story board
    let viewController = storyboard.instantiateViewController(withIdentifier: "rootLogin") //akses viewcontroller

        let window = UIApplication.shared.windows.first
        window?.rootViewController = viewController
    }}



