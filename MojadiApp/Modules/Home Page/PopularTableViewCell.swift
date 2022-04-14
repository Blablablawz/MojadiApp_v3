//
//  PopularTableViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 08/04/22.
//

import UIKit

class PopularTableViewCell: UITableViewCell {

    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var popularCourse: UILabel!
    @IBOutlet weak var populerCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setup(){
        allButton.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 14)
        allButton.titleLabel?.textColor = UIColor(hex: "138D80")
        populerCollection.backgroundColor = .clear
        popularCourse.font = UIFont(name: "Nunito-SemiBold", size: 20)
        popularCourse.textColor = .white
        populerCollection.register(UINib(nibName: "PopularViewCell", bundle: nil), forCellWithReuseIdentifier: "popular_collection_cell")
    }

}
//titleCourse.textColor = .white
//titleCourse.font = UIFont(name: "Nunito-SemiBold", size: 14)
