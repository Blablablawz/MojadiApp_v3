//
//  HomeViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 05/04/22.
//

import UIKit

class HomeViewController: UIViewController{

    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var searchController: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var popular: [Popular] = [
        Popular(courseTitle: "Intro to Entrepreneurship", courseImage: "popular", courseTeacher: "Stephen Fox"),
        Popular(courseTitle: "Intro to Marketing", courseImage: "popular", courseTeacher: "Stephen Fox")
    ]
    
    var comingSoon: [Popular] = [
        Popular(courseTitle: "English For Business - Batch 2", courseImage: "guys", courseTeacher: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
        Popular(courseTitle: "English For Business - Batch 3", courseImage: "gurl", courseTeacher: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")]
    
    var category: [Categories] = [
        Categories(typeCourse: "Bahasa Inggris"),
        Categories(typeCourse: "Marketing"),
        Categories(typeCourse: "Creative"),
        Categories(typeCourse: "Art")
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
        // Do any additional setup after loading the view.
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ComingSoonViewCell", bundle: nil), forCellReuseIdentifier: "soonCell")
        signInSetup()
            
        if #available(iOS 13.0, *) {
            searchController.searchTextField.backgroundColor = .white
            searchController.searchTextField.borderStyle = .roundedRect
            searchController.searchTextField.attributedPlaceholder =  NSAttributedString.init(string: "Searching for anything...", attributes: [NSAttributedString.Key.backgroundColor:UIColor.clear,
                NSAttributedString.Key.strokeColor:UIColor(hex: "A1A1AA"),
                NSAttributedString.Key.foregroundColor:UIColor(hex: "A1A1AA")])
        } else {
            // Fallback on earlier versions
        }  //adapt the color here.
            
        
    
    }
    func signInSetup(){
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.layer.borderWidth = 1
        signInBtn.layer.borderColor = UIColor(hex: "1AE4CE").cgColor
        signInBtn.layer.cornerRadius = 14
        signInBtn.layer.masksToBounds
        
    }
    @objc func allButtonTapped(_ sender: Any){
        showSoonController()
    }
    @objc func seeAllButtonTapped(_ sender: Any){
        showPopularController()
    }

}

extension UIViewController{
    func navigateToHome() {
    let storyboard = UIStoryboard(name: "Tabbar", bundle: nil) //Akses story board
    let viewController = storyboard.instantiateViewController(withIdentifier: "tabbar") //akses viewcontroller
  
        let window = UIApplication.shared.windows.first
        window?.rootViewController = viewController
    }
    }

extension HomeViewController: UITableViewDataSource{
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return comingSoon.count
        default:
            return 0
     
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "category_cell", for: indexPath) as! CategoriesViewCell
            cell.collectionView.tag = 99
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        cell.collectionView.reloadData()
        return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "popular_cell", for: indexPath) as! PopularTableViewCell
            cell.populerCollection.tag = 100
            cell.populerCollection.dataSource = self
            cell.populerCollection.delegate = self
            cell.populerCollection.reloadData()
            cell.popularCourse.text = "Popular Course"
            cell.allButton.addTarget(self, action: #selector(self.seeAllButtonTapped(_:)), for: .touchUpInside)
            cell.allButton.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 14)
            cell.allButton.titleLabel?.textColor = UIColor(hex: "138D80")
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "soonCell", for: indexPath) as! ComingSoonViewCell
            let image = UIImage(named: comingSoon[indexPath.row].courseImage)
            cell.soonDesc.text = comingSoon[indexPath.row].courseTeacher
            cell.soonImage.image = image
            cell.soonTitle.text = comingSoon[indexPath.row].courseTitle
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}


extension HomeViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 99{
            return category.count
        } else if collectionView.tag == 100{
            return popular.count
       
            
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 99{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catcoll_cell", for: indexPath) as! CatCollectionCell
        cell.nameLabel.text = category[indexPath.row].typeCourse
        return cell
            
        }else if collectionView.tag == 100{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popular_collection_cell", for: indexPath) as! PopularViewCell
            let image = UIImage(named: popular[indexPath.row].courseImage)
         
            cell.imageCourse.image = image
            cell.titleCourse.text = popular[indexPath.row].courseTitle
            cell.teacherCourse.text = popular[indexPath.row].courseTeacher
            return cell
        }
      
            return UICollectionViewCell()

        
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 99{
        return CGSize(width: 120, height: 27)
        } else{
            return CGSize(width: 195, height: 216)
        }
            return CGSize(width: 0, height: 0)
    
    
        
    
}
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if collectionView.tag == 100{
//            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
//    }
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 100{
            return 20
        }
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 100{
            return 20
        }
        return 8
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2{
            let view = UIView(frame: .zero)
            view.backgroundColor = .clear
            
            let label = UILabel(frame: .zero)
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .white
            label.text = "Coming Soon"
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
                
            ])
            
            let button = UIButton(frame: .zero)
            button.setTitle("See all", for: .normal)
            button.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 14)
            button.setTitleColor(UIColor(hex: "138D80"), for: .normal)
            
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            
            ])
            button.addTarget(self, action: #selector(self.allButtonTapped(_:)), for: .touchUpInside)
            return view
        } else{
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2{
            return 20 // tinggi view di set 56
        }
        else {
            return 0.0001
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
}


