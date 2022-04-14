//
//  TransactionViewController.swift
//  Ngetest
//
//  Created by yoga arie on 30/03/22.
//

import UIKit

class TransactionViewController: UIViewController {
    @IBOutlet weak var transactionTable: UITableView!
    let transactionHistory: [Transaction] = [
    Transaction(namePackage: "Paket Basic", advantages1: "• Personal Online Assessment", advantages2: "• Video Sharing Experiment", advantages3: "• Ask Expert (3 Pertanyan)",  pricePackage: "Rp 252.000,00", methodPayment: "BNI Virtual Account", datePayment: "05-03-2022", hourPayment: "18:56"),
    Transaction(namePackage: "Paket Premium", advantages1: "• Personal Online Assessment", advantages2: "• Video Sharing Experiment", advantages3: "• Ask Expert (10 Pertanyan)",  pricePackage: "Rp 360.000,00", methodPayment: "BNI Virtual Account", datePayment: "05-03-2022", hourPayment: "18:56"),
    Transaction(namePackage: "Paket Premium", advantages1: "• Personal Online Assessment", advantages2: "• Video Sharing Experiment", advantages3: "• Ask Expert (10 Pertanyan)",  pricePackage: "Rp 360.000,00", methodPayment: "BNI Virtual Account", datePayment: "05-03-2022", hourPayment: "18:56")]
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerSetup()
        view.backgroundColor = UIColor(hex: "16171D")
        transactionTable.dataSource = self
        transactionTable.backgroundColor = .clear
    }
    func viewControllerSetup(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .black
    }

    

}

extension TransactionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transaction_cell", for: indexPath) as! TransactionViewCell
        let transaction = transactionHistory[indexPath.row]
        cell.advantages1.text = transaction.advantages1
        cell.advantages2.text = transaction.advantages2
        cell.advantages3.text = transaction.advantages3
        cell.hourPayment.text = transaction.hourPayment
        cell.methodPayment.text = transaction.methodPayment
        cell.packageType.text = transaction.namePackage
        cell.datePayment.text = transaction.datePayment
        cell.pricePayment.text = transaction.pricePackage
        
        return cell
    }
    
    
}
extension UIViewController {
    
    func showHistoryController(){
        let storyboard = UIStoryboard(name: "Transaction", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "history") as! TransactionViewController
   
     //    present(viewController, animated: true, completion: nil)
         navigationController?.pushViewController(viewController, animated: true)
         
    }
}

