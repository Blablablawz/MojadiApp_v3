//
//  PopularViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 12/04/22.
//

import UIKit

class PopularViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var popular: [Popular] = [
        Popular(courseTitle: "Intro to Entrepreneurship", courseImage: "popular1", courseTeacher: "Stephen Fox"),
        Popular(courseTitle: "Intro to Marketing", courseImage: "popular2", courseTeacher: "Stephen Fox"),
        Popular(courseTitle: "Intro to Creative", courseImage: "popular3", courseTeacher: "Stephen Fox")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "16171D")
        title = "Popular Course"
        tableView.backgroundColor = .clear
        tableView.dataSource = self

        tableView.register(UINib(nibName: "PopTableViewCell", bundle: nil), forCellReuseIdentifier: "cell_poppular")
        // Do any additional setup after loading the view.
        viewControllerSetup()
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

extension PopularViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        popular.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_poppular", for: indexPath) as! PopTableViewCell
        let image = UIImage(named: popular[indexPath.row].courseImage)
     
        cell.imageCourse.image = image
        cell.titleCourse.text = popular[indexPath.row].courseTitle
        cell.teacherCourse.text = popular[indexPath.row].courseTeacher
        
        return cell
    }
    
    
}

extension UIViewController {
    
    func showPopularController(){
        let storyboard = UIStoryboard(name: "Popular", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "rootPopular") as! PopularViewController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}

