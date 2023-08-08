//
//  DiaryTableViewCell.swift
//  OneLineDiary
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    let identifier = "DiaryTableViewCell"

    @IBOutlet var backView: UIView!
    @IBOutlet var contentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
