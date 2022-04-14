//
//  ComingSoonViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 10/04/22.
//

import UIKit

class ComingSoonViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var soonDesc: UILabel!
    @IBOutlet weak var soonTitle: UILabel!
    @IBOutlet weak var soonImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
                let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .clear
        setupViews()
    }
    func setupViews(){
        containerView.layer.cornerRadius = 14
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = UIColor(hex: "292934")
        soonDesc.textColor = UIColor(hex: "71717A")
        soonDesc.font = UIFont(name: "Nunito-Regular", size: 12)
        soonTitle.font = UIFont(name: "Nunito-SemiBold", size: 14)
        soonTitle.textColor = .white
    }
}
