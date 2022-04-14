//
//  AboutViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 11/04/22.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
  
    let about: [Categories] = [
        Categories(typeCourse: "Terms of Use"),
        Categories(typeCourse: "Privacy Policy"),
        Categories(typeCourse: "Intellectual Property Policy"),
        Categories(typeCourse: "About Us"),
        Categories(typeCourse: "FAQ")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About MojadiPro"
        view.backgroundColor = UIColor(hex: "16171D")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
       
        // Do any additional setup after loading the view.
        
    }
    
    
//        button.addTarget(self, action: #selector(self.languageButtonTapped(_:)), for: .touchUpInside)
    
    }



extension AboutViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "about_cell", for: indexPath) as! AboutTableViewCell
        cell.aboutLabel.text = about[indexPath.row].typeCourse
        
        return cell
    }
    
    
}

extension UIViewController {
    
    func showAboutController(){
        let storyboard = UIStoryboard(name: "About", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "about") as! AboutViewController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}

extension AboutViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
}
