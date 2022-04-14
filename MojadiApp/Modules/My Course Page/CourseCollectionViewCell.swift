//
//  CourseCollectionViewCell.swift
//  MojadiPro
//
//  Created by yoga arie on 16/03/22.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: CardView!
    @IBOutlet weak var progressCourse: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        progressCourse.textColor = UIColor(hex: "B6E9E3")
        setupContainer()
        self.backgroundColor = UIColor.clear
        self.layer.borderColor = UIColor(hex: "B6E9E3").cgColor
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.0
    
    }
  
    func setupContainer(){
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
    }

}
