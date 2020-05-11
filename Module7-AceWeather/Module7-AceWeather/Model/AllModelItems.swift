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
        return 1
    }
    var details : [MoreInfoModel]
    
    init(details : [MoreInfoModel]) {
        self.details = details
    }
}

class HourlyForecast: DashBoardViewModelItem {
    
    var type: WeatherDashBoardItemType{
        return .hourlyForecaset
    }
    
    var sectionTitle: String{
        return "Hourly Forecast"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var details : [Currently]
    
    init(details : [Currently]) {
        self.details = details
    }
}


class WeeklyForecast: DashBoardViewModelItem {
    
    var type: WeatherDashBoardItemType{
        return .forecastWeekly
    }
    
    var sectionTitle: String{
        return "7 Days Forecast"
    }
    
    var rowCount: Int {
        return details.count
    }
    
    var details : [DailyDatum]
    
    init(details : [DailyDatum]) {
        let values = (1..<details.count).map { (i) -> DailyDatum in
            return details[i]
        }

        self.details = values
    }
}
