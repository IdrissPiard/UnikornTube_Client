//
//  VideoListCell.swift
//  UnikornTube
//
//  Created by Damien Serin on 02/06/2015.
//  Copyright (c) 2015 SimpleAndNew. All rights reserved.
//

import UIKit

class VideoListCell: UITableViewCell {
    
    @IBOutlet weak var totalView: UILabel!
    @IBOutlet weak var imgTotalView: UIImageView!
    @IBOutlet weak var nbDislike: UILabel!
    @IBOutlet weak var imgNbDislike: UIImageView!
    @IBOutlet weak var nbLike: UILabel!
    @IBOutlet weak var imgNbLike: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var uploaded: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
