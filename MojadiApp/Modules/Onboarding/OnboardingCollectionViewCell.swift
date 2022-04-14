//
//  OnboardingCollectionViewCell.swift
//  MojadiApp
//
//  Created by yoga arie on 04/04/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
   
   
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    
    func setup(_ slides: OnboardingSlide){
        
        slideImageView.image = UIImage(named: slides.image)
        slideTitleLabel.text = slides.title
        
    }
    
}
