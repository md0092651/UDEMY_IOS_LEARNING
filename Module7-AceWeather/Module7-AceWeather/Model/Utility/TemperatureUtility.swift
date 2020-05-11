//
//  TemperatureUtility.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 11/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import Foundation

class Temperatureutility {
    
    static func formattedTemperatureString(temperature: Double) -> String {
        return "\(formattedTemperature(temperature: temperature))"
    }
    
    static func formattedTemperature(temperature: Double) -> Double {
        let unit = UserDefaults.standard.string(forKey: "units")
        if let unitType = unit {
             print(unitType)
                   if unitType == UnitType.Imperial.rawValue {
                       return (temperature - 32) * (5/9)
                   }else{
                       return temperature
                   }
        }else{
            return temperature
        }
       
    }
}
