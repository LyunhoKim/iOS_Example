//
//  PhotoTableViewCell.swift
//  PhotosSample
//
//  Created by Lyunho Kim on 01/08/2019.
//  Copyright © 2019 Lyunho Kim. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    
    @IBOutlet var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
