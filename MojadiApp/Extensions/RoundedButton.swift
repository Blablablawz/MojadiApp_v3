//
//  RoundedButton.swift
//  Ngetest
//
//  Created by yoga arie on 15/03/22.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable
    var cornerRadius: CGFloat = 20
    
    @IBInspectable
    var height: CGFloat = 40
    
    weak var heightConstraint: NSLayoutConstraint?
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height)
        ])
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
    }
}


