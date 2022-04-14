//
//  PrimaryButton.swift
//  Siniar
//
//  Created by Bayu Yasaputro on 25/03/22.
//

import UIKit

class PrimaryButton: UIButton {
    
    convenience init() {
        self.init(type: .system)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        tintColor = .white
        backgroundColor = UIColor(hex: "1AE4CE")
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}
