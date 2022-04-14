//
//  NotificationTableViewCell.swift
//  MojadiPro
//
//  Created by yoga arie on 14/03/22.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    @IBOutlet weak var notifDate: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var notifInfo: UILabel!
    @IBOutlet weak var notifImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = UIColor.clear
        setup()
    }
    func setup(){
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        containerView.layer.backgroundColor =  UIColor.clear.cgColor
        notifDate.textColor = .white
        notifInfo.textColor = .white
        
    }
    
}
