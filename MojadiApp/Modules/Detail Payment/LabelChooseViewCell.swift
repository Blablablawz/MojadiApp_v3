//
//  LabelChooseViewCell.swift
//  MojadiApp
//
//  Created by Yafi Cahyono Adi on 14/04/22.
//

import UIKit

class LabelChooseViewCell: UITableViewCell {

    @IBOutlet weak var containerLabel: UIView!
    @IBOutlet weak var labelChoose: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
