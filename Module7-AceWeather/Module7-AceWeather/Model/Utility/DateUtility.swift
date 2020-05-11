//
//  DateUtility.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 10/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import Foundation

class DateUtility {
    
    static func formatUnixDate(withFormat  format: DateFormat, unixTimeStamp : Double) -> String{
        let date = Date(timeIntervalSince1970: unixTimeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: date)
    }
}

enum DateFormat: String{
    case MM_DD_YYYY = "MM-dd-yyyy"
    case HH_mm = "HH:mm a"
    case EEE = "EEE"
}
