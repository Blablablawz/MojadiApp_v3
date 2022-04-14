//
//  LanguageViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 11/04/22.
//

import UIKit

class LanguageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
        // Do any additional setup after loading the view.
    }
    

   

}

extension UIViewController {
    
    func showLanguageViewController(){
        let storyboard = UIStoryboard(name: "Setting", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "language") as! LanguageViewController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
