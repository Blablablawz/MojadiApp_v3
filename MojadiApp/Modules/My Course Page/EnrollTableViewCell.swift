//
//  EnrollTableViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 10/03/22.
//

import UIKit

class EnrollTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    weak var shadowLayer: CAShapeLayer!
    var cornerRadius: CGFloat = 0
    @IBOutlet weak var expiredEnroll: UILabel!
    @IBOutlet weak var progressEnroll: UILabel!
    @IBOutlet weak var studyEnroll: UILabel!
    @IBOutlet weak var buttonEnroll: UIImageView!
    @IBOutlet weak var imageEnroll: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setup()
        self.layer.backgroundColor = UIColor.clear.cgColor
            self.layer.cornerRadius = 10
            self.layer.masksToBounds = true
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    func setup(){
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(hex: "14B8A6").cgColor
        studyEnroll.textColor = UIColor.white
        progressEnroll.textColor = UIColor(hex: "138D80")
        expiredEnroll.textColor = UIColor(hex: "71717A")
        containerView.layer.backgroundColor = UIColor.clear.cgColor
        
    }
//    func roundedCell(){
//        if shadowLayer == nil {
//            let shadowLayer = CAShapeLayer()
//            layer.insertSublayer(shadowLayer, at: 0)
//            self.shadowLayer = shadowLayer
//        }
//
//        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//        shadowLayer?.fillColor = UIColor.white.cgColor
//        shadowLayer?.path = path.cgPath
//
//        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//        shadowLayer?.shadowColor = UIColor.darkGray.cgColor
//        shadowLayer?.shadowPath = shadowPath.cgPath
//        shadowLayer?.shadowOffset = CGSize(width: 0, height: 1)
//        shadowLayer?.shadowOpacity = 0.2
//        shadowLayer?.shadowRadius = 3
//
//
//    }
//
//    func setup() {
//        backgroundColor = .clear
//    }
}

