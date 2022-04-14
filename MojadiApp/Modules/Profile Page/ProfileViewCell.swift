//
//  ProfileViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 11/04/22.
//

import UIKit

class ProfileViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imgSetting: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setup()
    }
    
    func setup(){
        nameLabel.font = UIFont(name: "Nunito-SemiBold", size: 14)
        nameLabel.textColor = .white
        backgroundColor = UIColor(hex: "292934")
    }
    
}
