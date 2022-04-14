//
//  PaymentInfoViewController.swift
//  Ngetest
//
//  Created by yoga arie on 20/03/22.
//

import UIKit

class PaymentInfoViewController: UIViewController {

    var paket = [Paket]()
    
    @IBOutlet weak var paymentInfoTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentInfoTable.dataSource = self
        // Do any additional setup after loading the view.
        initData()
        viewControllerSetup()
        let button = UIButton(type: .system)
            if #available(iOS 13.0, *) {
                button.setImage(UIImage(named: "Vector"), for: .normal)
                button.tintColor = UIColor(hex: "FFFFFF")
            } else {
                // Fallback on earlier versions
            }
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        button.addTarget(self, action: #selector(self.refreshButtonTapped(_:)), for: .touchUpInside)
        let barItem = UIBarButtonItem(customView:  button)
        navigationItem.rightBarButtonItem = barItem
    }
    @objc func refreshButtonTapped(_ sender: Any){
        showHistoryController()
    }
    
    
    @IBAction func buyButton(_ sender: Any) {
        navigateToPaymentDetail()
    }
    
    
    
    func initData(){
        let package1 = Paket(imgPaket: "package1", pricePaket: "Rp 252.000,00", discountPaket: "Rp 279.999,00", namePaket: "Paket Basic")
        let package2 = Paket(imgPaket: "package2", pricePaket: "Rp 306.000,00", discountPaket: "Rp 360.000,00 ", namePaket: "Paket Premium")
        let package3 = Paket(imgPaket: "package3", pricePaket: "Rp 562.500,00", discountPaket: "Rp 750.000,00 ", namePaket: "Paket Ultimate")
        
        paket.append(package1)
        paket.append(package2)
        paket.append(package3)


    }
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        view.backgroundColor = UIColor(hex: "16171D")
        paymentInfoTable.backgroundColor = .clear
        
    }
    
}

extension PaymentInfoViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paymentInfoTable.dequeueReusableCell(withIdentifier: "paket_cell", for: indexPath) as! PaymentInfoViewCell
//        let image = UIImage(named: datas[indexPath.row].imgCategory)
//        cell.categoryImageCollection.image = image
//
//        cell.categoryNameCollection.text = datas[indexPath.row].nameCategory
//        cell.categoryNumberCollection.text = datas[indexPath.row].numberCategory
//        return cell
//        signUpLabel.textColor = .white
        let image = UIImage(named: paket[indexPath.row].imgPaket)
        cell.packageImg.image = image
        
        
        cell.packageName.text = paket[indexPath.row].namePaket
        cell.packageDiscount.text = paket[indexPath.row].discountPaket
        cell.packagePrice.text = paket[indexPath.row].pricePaket
        cell.packageBtn.setTitle("Pilih", for: .normal)
        cell.packageBtn.backgroundColor = UIColor(hex: "#1AE4CE")
         return cell
    }
    
    
}
