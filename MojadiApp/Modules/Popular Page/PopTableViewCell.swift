//
//  PopTableViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 12/04/22.
//

import UIKit

class PopTableViewCell: UITableViewCell {
    @IBOutlet weak var teacherCourse: UILabel!
    @IBOutlet weak var titleCourse: UILabel!
    @IBOutlet weak var imageCourse: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
  
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0 ))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
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



