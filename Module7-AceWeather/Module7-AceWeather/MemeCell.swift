//
//  MemeCell.swift
//  MemeIQ
//
//  Created by Michael Rojas on 7/8/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit

class MemeCell: UICollectionViewCell {

    @IBOutlet var image: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: MoreInfoModel) {
        image.image = model.image
        
    }
}
