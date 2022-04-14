//
//  NotificationViewController.swift
//  MojadiPro
//
//  Created by yoga arie on 14/03/22.
//

import UIKit

class NotificationViewController: UIViewController {
    let notification : [Notif] = [
        Notif(imageNotif: "notif_new", descNotif: "Saat ini ada promo menarik di mojadiapp, untuk course bahasa inggris. Yuk segera cek..", dateNotif: "15 Februari 2022"),
        Notif(imageNotif: "notif_logo", descNotif: "Saat ini ada kursus terbaru ada di Mojadiapp. Yuk cek disini.." , dateNotif: "Yesterday")
    ]
    
    @IBOutlet weak var notifTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        notifTable.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "cell_notif")
        notifTable.dataSource = self
        view.backgroundColor = UIColor(hex: "16171D")
        notifTable.backgroundColor = .clear
       
        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
extension NotificationViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notification.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notifTable.dequeueReusableCell(withIdentifier: "cell_notif", for: indexPath) as! NotificationTableViewCell
//        let progressBar = progress[indexPath.row]
//        let image = UIImage(named: datas[indexPath.row].imgCategory)
//        cell.categoryImage.image = image
//
//        cell.categoryName.text = datas[indexPath.row].nameCategory
//        cell.categoryNumber.text = datas[indexPath.row].numberCategory
//        return cell
        let notif = notification[indexPath.row]
        let image = UIImage(named: notification[indexPath.row].imageNotif)

        
        cell.notifDate.text = notif.dateNotif
        cell.notifInfo.text = notif.descNotif
        cell.notifImg.image = image
        return cell
    }
//    let image = UIImage(named: datas[indexPath.row].imgCategory)
//    cell.categoryImage.image = image?\
    
}

extension UIViewController {
    
    func showNotifController(){
        let storyboard = UIStoryboard(name: "Notification", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "notifpage") as! NotificationViewController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}
