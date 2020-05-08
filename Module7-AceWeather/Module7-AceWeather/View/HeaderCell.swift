//
//  HeaderCell.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 09/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit
import Gifu

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var currrentCityNameLabel: UILabel!
    @IBOutlet weak var ccurrentWeatherConditionLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var imageGif: GIFImageView!
    
    var item: DashBoardViewModelItem? {
        didSet {
            guard let item = item as? HeaderViewModelItem else {
                return
            }
            
            currrentCityNameLabel?.text = item.currrentCityName
            ccurrentWeatherConditionLabel?.text = item.currentWeatherCondition
            currentTemperatureLabel?.text = item.currentTemperature
            imageGif.animate(withGIFNamed: "01d") {
              print("It's animating!")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageGif?.prepareForReuse()
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
