//
//  PackageInfoViewCell.swift
//  MojadiApp
//
//  Created by Yafi Cahyono Adi on 12/04/22.
//

import UIKit

class PackageInfoViewCell: UITableViewCell {

    @IBOutlet weak var advantages: UILabel!
    @IBOutlet weak var containerInside: UIView!
    @IBOutlet weak var pricePackage: UILabel!
    @IBOutlet weak var titlePackage: UILabel!
    @IBOutlet weak var containerPayment: UIView!
    @IBOutlet weak var containerOutside: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        paymentMod()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func paymentMod(){
        containerOutside.layer.backgroundColor = UIColor.black.cgColor
        containerOutside.layer.cornerRadius = 15
        containerOutside.layer.masksToBounds = true
        containerOutside.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        containerOutside.layer.borderWidth = 1

        containerInside.layer.backgroundColor = UIColor(hex: "292934").cgColor
        containerInside.layer.cornerRadius = 10
        containerInside.layer.masksToBounds = true
    }

}
