//
//  CatCollectionCell.swift
//  MojadiApp
//
//  Created by yoga arie on 07/04/22.
//

import UIKit

class CatCollectionCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor(hex: "292934")
        setup()
    }
    func setup(){
        nameLabel.textColor = UIColor(hex: "138D80")
        layer.cornerRadius = 13
        layer.masksToBounds = true
        nameLabel.font = UIFont(name: "Nunito-Regular", size: 14)
    }

}
