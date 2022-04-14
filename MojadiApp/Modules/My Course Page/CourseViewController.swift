//
//  CourseViewController.swift
//  MojadiPro
//
//  Created by yoga arie on 16/03/22.
//

import UIKit

class CourseViewController: UIViewController {
    var selectIndex = 0
    var progress = [Status]()
    var dataCourse = [Course]()
    @IBOutlet weak var tableProgress: UITableView!
    @IBOutlet weak var courseCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableProgress.register(UINib(nibName: "EnrollTableViewCell", bundle: nil), forCellReuseIdentifier: "enroll_cell")
        courseCollection.register(UINib(nibName: "CourseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_course")
        tableProgress.dataSource = self
        tableProgress.delegate = self
        courseCollection.dataSource = self
        courseCollection.delegate = self
        dummyData()
        conditionData()
        viewControllerSetup()
        let button = UIButton(type: .system)
            if #available(iOS 13.0, *) {
                button.setImage(UIImage(named: "notificationIcon"), for: .normal)
                button.tintColor = UIColor(hex: "14B8A6")
            } else {
                // Fallback on earlier versions
            }
        button.frame = CGRect(x: 0, y: 0, width: 26, height: 26)
        button.addTarget(self, action: #selector(self.notifButtonTapped(_:)), for: .touchUpInside)
        let barItem = UIBarButtonItem(customView:  button)
        navigationItem.rightBarButtonItem = barItem
            
    }
    
    @objc func notifButtonTapped(_ sender: Any){
        showNotifController()
    }
    
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        view.backgroundColor = UIColor(hex: "16171D")
        tableProgress.backgroundColor = .clear
        
    }
    
    func conditionData(){
        let data1 = Course(name: "Bahasa Inggris", teacher: "Hanna Olive", status: "Not Started", statusName: "Will be started")
        let data2 = Course(name: "Matematika", teacher: "Hanna Olive", status: "On Going", statusName: "Progress 3/50")
        let data3 = Course(name: "Kimia", teacher: "Hanna Olive", status: "On Going", statusName: "Progress 3/50")
        let data4 = Course(name: "Sejarah", teacher: "Hanna Olive", status: "Completed", statusName: "Finished")
        let data5 = Course(name: "Biologi", teacher: "Hanna Olive", status: "Completed", statusName: "Finished")
        let data6 = Course(name: "Astronomi", teacher: "Hanna Olive", status: "Completed", statusName: "Finished")
        
        dataCourse.append(data1)
        dataCourse.append(data2)
        dataCourse.append(data3)
        dataCourse.append(data4)
        dataCourse.append(data5)
        dataCourse.append(data6)
    }
    func dummyData(){
        
    //blm diselect
        let dummy2 = Status(count: 1, progressName: "Not Started", select: true)
        let dummy3 = Status(count: 0, progressName: "On Going", select: false)
        let dummy4 = Status(count: 3, progressName: "Completed", select: false)
        
        
     
        progress.append(dummy2)
        progress.append(dummy3)
        progress.append(dummy4)
    }



}
extension CourseViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return progress.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        let attText = NSMutableAttributedString(
        //            string: "Covid-19 News : ",
        //            attributes: [
        //                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold),
        //                NSAttributedString.Key.foregroundColor : UIColor(hex: "0077B6")
        //            ])
        //
        //        attText.append(NSAttributedString(string: covidNews, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular),
        //        NSAttributedString.Key.foregroundColor : UIColor(hex: "7F7F7F")])
        //        )
        //
        //        cell.titleLabel.attributedText = attText
                
        let cell = courseCollection.dequeueReusableCell(withReuseIdentifier: "cell_course", for: indexPath) as! CourseCollectionViewCell
        
        
        let progressBar = progress[indexPath.row]
        

        
        
        
        cell.progressCourse.text = progressBar.progressName
        print(progressBar.select)
            
            
        if progressBar.select == true {
           
            cell.containerView.backgroundColor = UIColor(hex: "14B8A6")
       
            cell.progressCourse.textColor = UIColor.white
            cell.layer.backgroundColor = UIColor(hex: "B6E9E3").cgColor
//            cell.layer.borderColor = UIColor(hex: ConstantColor.green).cgColor
        } else {

            cell.containerView.backgroundColor = UIColor(hex: "B6E9E3")
  
            cell.progressCourse.textColor = UIColor(hex: "138D80")
//            cell.layer.borderColor = UIColor(hex: ConstantColor.gray).cgColor
            cell.layer.backgroundColor = UIColor(hex:"B6E9E3").cgColor
        }
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
//
        selectIndex = indexPath.row
            progress[indexPath.row].select = true
            
        
            
            for i in progress.indices {
                print(i)
                if i != indexPath.row{
                    progress[i].select = false
                    
                }
                
            }
        tableProgress.reloadData()
        courseCollection.reloadData()
        
        
    }
   
    
    
}

extension CourseViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let notStarted = dataCourse.filter({$0.status == "Not Started"})
        let onGoing = dataCourse.filter({$0.status == "On Going"})
        let completed = dataCourse.filter({$0.status == "Completed"})
        switch selectIndex{
      
        case 0:
            return notStarted.count
        case 1:
            return onGoing.count
        default:
            return completed.count
    }
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableProgress.dequeueReusableCell(withIdentifier: "enroll_cell", for: indexPath) as! EnrollTableViewCell
       
       
        let notStarted = dataCourse.filter({$0.status == "Not Started"})
        let onGoing = dataCourse.filter({$0.status == "On Going"})
        let completed = dataCourse.filter({$0.status == "Completed"})
        switch selectIndex{
       
        case 0:
            
               cell.studyEnroll.text = notStarted[indexPath.row].name
               cell.progressEnroll.text = notStarted[indexPath.row].teacher
               cell.expiredEnroll.text = notStarted[indexPath.row].statusName
               break
        case 1:
            
               cell.studyEnroll.text = onGoing[indexPath.row].name
               cell.progressEnroll.text = onGoing[indexPath.row].teacher
               cell.expiredEnroll.text = onGoing[indexPath.row].statusName
                break
        case 2:
            
               cell.studyEnroll.text = completed[indexPath.row].name
               cell.progressEnroll.text = completed[indexPath.row].teacher
               cell.expiredEnroll.text = completed[indexPath.row].statusName
                 break
            
            
        default:
            break
        }
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Course", bundle: nil)
//        let editController = storyboard.instantiateViewController(withIdentifier: "video") as! VideoViewController
//        show(editController, sender: self)
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90
//    }

    
}

