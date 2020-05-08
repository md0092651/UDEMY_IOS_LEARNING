//
//  HeaderViewModelItem.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 08/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit

class HeaderViewModelItem: DashBoardViewModelItem {
    var currentWeatherCondition : String
    var currrentCityName : String
    var currentTemperature : String
    var daysLowTemperature :String
    var daysHighTemperature: String
    
    var type: WeatherDashBoardItemType{
        return .header
    }
    
    //TODO create methods for formatting the temperature in format 18°C later
    
    
    init(summary currentWeatherCondition : String, currrentCityName : String ,currentTemperature : String, daysLowTemperature :String, daysHighTemperature:String) {
        self.currentWeatherCondition = currentWeatherCondition
        self.currrentCityName = currrentCityName
        self.currentTemperature = currentTemperature
        self.daysLowTemperature = daysLowTemperature
        self.daysHighTemperature = daysHighTemperature
    }
}


class DetailsModelItem : DashBoardViewModelItem{
    
    var type: WeatherDashBoardItemType{
        return .details
    }
    
    var sectionTitle: String{
        return "Details"
    }
    
    var rowCount: Int {
        return details.count
    }
    var details : [MoreInfoModel]
    
    init(details : [MoreInfoModel]) {
        self.details = details
    }
    
    
}
