//
//  SoonViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 12/04/22.
//

import UIKit

class SoonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var comingSoon: [Popular] = [
        Popular(courseTitle: "English For Business - Batch 2", courseImage: "guys", courseTeacher: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
        Popular(courseTitle: "English For Business - Batch 3", courseImage: "gurl", courseTeacher: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "16171D")
        title = "Coming Soon"
        viewControllerSetup()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ComingSoonViewCell", bundle: nil), forCellReuseIdentifier: "soonCell")
        tableView.backgroundColor = .clear
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = UIColor(hex: "292934")
            searchBar.searchTextField.borderStyle = .roundedRect
            searchBar.barTintColor = UIColor(hex: "16171D")
            searchBar.searchTextField.attributedPlaceholder =
            NSAttributedString.init(string: "Searching for anything...", attributes: [NSAttributedString.Key.backgroundColor:UIColor.clear,
                NSAttributedString.Key.strokeColor:UIColor(hex: "A1A1AA"),
                NSAttributedString.Key.foregroundColor:UIColor(hex: "A1A1AA")])
        } else {
            // Fallback on earlier versions
        }  //adapt the color here.
       
    }
    
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .black
    }

}

extension UIViewController {
    
    func showSoonController(){
        let storyboard = UIStoryboard(name: "ComingSoon", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "soon") as! SoonViewController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}

extension SoonViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comingSoon.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "soonCell", for: indexPath) as! ComingSoonViewCell
        let image = UIImage(named: comingSoon[indexPath.row].courseImage)
        cell.soonDesc.text = comingSoon[indexPath.row].courseTeacher
        cell.soonImage.image = image
        cell.soonTitle.text = comingSoon[indexPath.row].courseTitle
        return cell
    }
    
    
}

extension UISearchBar {

func change(textFont : UIFont?) {

    for view : UIView in (self.subviews[0]).subviews {

        if let textField = view as? UITextField {
            textField.font = textFont
        }
    }
} }
