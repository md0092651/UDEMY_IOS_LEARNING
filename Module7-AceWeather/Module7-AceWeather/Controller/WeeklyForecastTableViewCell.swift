//
//  WeeklyForecastTableViewCell.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 11/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit

class WeeklyForecastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weekDay: UILabel!
    @IBOutlet weak var lowHigh: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    var item: DailyDatum? {
          didSet {
            guard let item = item else {
                  return
              }
            
            weekDay.text = DateUtility.formatUnixDate(withFormat: DateFormat.EEE, unixTimeStamp: item.time)
            weatherCondition.text = item.getWetherCondition()
            weatherIcon.image = item.getWeatherConditionIcon()
            lowHigh.text = item.getHighLowTemperatureString()
          }
      }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}


