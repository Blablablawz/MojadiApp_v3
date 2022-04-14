//
//  PaymentInfoViewCell.swift
//  Ngetest
//
//  Created by yoga arie on 20/03/22.
//

import UIKit

class PaymentInfoViewCell: UITableViewCell {

    @IBOutlet weak var packageBtn: UIButton!
    @IBOutlet weak var packageDiscount: UILabel!
    @IBOutlet weak var packagePrice: UILabel!
    @IBOutlet weak var packageName: UILabel!
    @IBOutlet weak var packageImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
        packageDiscount.attributedText = "my string".strikeThrough()
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    func setup(){
//        signUpLabel.textColor = .white
        packageDiscount.textColor = UIColor(hex: "71717A")
        packagePrice.textColor = .white
        packageName.textColor = .white


    }
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
               value: NSUnderlineStyle.single.rawValue,
                   range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}

