//
//  CategoriesViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 07/04/22.
//

import UIKit

class CategoriesViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(){
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: "CatCollectionCell", bundle: nil), forCellWithReuseIdentifier: "catcoll_cell")
    }
    
}
