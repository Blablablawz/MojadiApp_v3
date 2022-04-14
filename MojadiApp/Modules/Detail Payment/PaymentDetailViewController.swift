//
//  PaymentDetailViewController.swift
//  MojadiApp
//
//  Created by Yafi Cahyono Adi on 12/04/22.
//

import UIKit

enum PaymentDetail{
    case package
    case bank
}


class PaymentDetailViewController: UIViewController{
    var paymentOption: [PaymentDetail] = [.package, .bank]
    
    @IBOutlet weak var detailTable: UITableView!
    let bankPayment: [Bank] = [Bank(bankName: "BNI Virtual Account", bankImage: "bni"),
    Bank(bankName: "BRI Virtual Account", bankImage: "bri"),
    Bank(bankName: "BCA Virtual Account", bankImage: "bca")]
    let modelPackages: [Advantages] = [
        Advantages(namePackage: "Paket Basic", advantages: "• Personal Online Assessment \n• Ask Ex \n• Video Sharing Expert",pricePackage: "Rp 252.000,00")
        
    
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "16171D")
        detailTable.backgroundColor = .black
        detailTable.dataSource = self
        viewControllerSetup()
        // Do any additional setup after loading the view.
    }
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .black
    }
    


}

extension PaymentDetailViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
       return paymentOption.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let payment = paymentOption[section]
        switch payment{
        case .package:
            return modelPackages.count
        case .bank:
            return bankPayment.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let payment = paymentOption[indexPath.section]
        
        if payment == .package{
            let cell = detailTable.dequeueReusableCell(withIdentifier: "package_cell", for: indexPath) as! PackageInfoViewCell
            
            cell.advantages.text = modelPackages[indexPath.row].advantages
            cell.pricePackage.text = modelPackages[indexPath.row].pricePackage
            cell.titlePackage.text = modelPackages[indexPath.row].namePackage
            return cell
        }
        else if indexPath.row == 0 {
            let cell = detailTable.dequeueReusableCell(withIdentifier: "label_Choose", for: indexPath) as! LabelChooseViewCell
            
                    return cell
                }
                else {
                    let cell = detailTable.dequeueReusableCell(withIdentifier: "bank_cell", for: indexPath) as! BankViewCell
                    
                    let image = UIImage(named: bankPayment[indexPath.row].bankImage)
                    cell.nameBank.text = bankPayment[indexPath.row].bankName
                    cell.imageBank.image = image
                    
                    return cell
                }
        }
    }

extension UIViewController{
    func navigateToPaymentDetail() {
    let storyboard = UIStoryboard(name: "DetailPayment", bundle: nil) //Akses story board
    let viewController = storyboard.instantiateViewController(withIdentifier: "payDetail") as! PaymentDetailViewController
  
        navigationController?.pushViewController(viewController, animated: true)
    }
    }
