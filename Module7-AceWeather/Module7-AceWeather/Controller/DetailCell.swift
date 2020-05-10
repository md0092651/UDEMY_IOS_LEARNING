//
//  DetailCell.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 09/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var value : UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    var item: MoreInfoModel? {
        didSet {
            guard let item = item else {
                return
            }
            title?.text = item.title
            value?.text = item.subTitle
            icon?.image = item.image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
