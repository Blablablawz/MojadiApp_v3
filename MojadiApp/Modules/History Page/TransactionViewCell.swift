//
//  TransactionViewCell.swift
//  Ngetest
//
//  Created by yoga arie on 30/03/22.
//

import UIKit

class TransactionViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var packageType: UILabel!
    @IBOutlet weak var pricePayment: UILabel!
    @IBOutlet weak var advantages1: UILabel!
    @IBOutlet weak var advantages2: UILabel!
    @IBOutlet weak var advantages3: UILabel!
    @IBOutlet weak var containerOutside: UIView!
    @IBOutlet weak var datePayment: UILabel!
    @IBOutlet weak var hourPayment: UILabel!
    @IBOutlet weak var methodPayment: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
        setupColor()
        // Configure the view for the selected state
    }
    func setup(){
        containerView.layer.backgroundColor = UIColor.clear.cgColor
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        containerView.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        containerView.layer.borderWidth = 1
        containerOutside.layer.backgroundColor = UIColor(hex: "292934").cgColor
        containerOutside.layer.cornerRadius = 10
        containerOutside.layer.masksToBounds = true
    }
    func setupColor(){
        packageType.textColor = .white
        advantages1.textColor = .white
        advantages2.textColor = .white
        advantages3.textColor = .white
        datePayment.textColor = UIColor(hex: "8D8D8D")
        hourPayment.textColor = UIColor(hex: "8D8D8D")
        methodPayment.textColor = UIColor(hex: "8D8D8D")
        pricePayment.textColor = .white
    }
}
