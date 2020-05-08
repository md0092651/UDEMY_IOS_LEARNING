//
//  MoreInfoCellCollectionViewCell.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 07/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit


class MoreInfoCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellIcon: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellValue: UILabel!
    
    static let identifier = "MoreInfoCellCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    public func config(with model : MoreInfoModel){
        cellTitle.text = model.title
        cellValue.text = model.subTitle
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MoreInfoCellCollectionViewCell", bundle: nil)
    }
}
