//
//  PopularViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 08/04/22.
//

import UIKit

class PopularViewCell: UICollectionViewCell {

    @IBOutlet weak var teacherCourse: UILabel!
    @IBOutlet weak var titleCourse: UILabel!
    @IBOutlet weak var imageCourse: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    func setup(){
        self.backgroundColor = .clear
//            nameLabel.textColor = UIColor(hex: "138D80")
//            layer.cornerRadius = 13
//            layer.masksToBounds = true
//            nameLabel.font = UIFont(name: "Nunito-Regular", size: 14)
        titleCourse.textColor = .white
        titleCourse.font = UIFont(name: "Nunito-SemiBold", size: 14)
        teacherCourse.textColor = UIColor(hex: "71717A")
        teacherCourse.font = UIFont(name: "Nunito-Regular", size: 12 )
    }
}
