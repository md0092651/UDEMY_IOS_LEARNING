//
//  DashBoardViewModelItem.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 08/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import Foundation

protocol DashBoardViewModelItem {
    var type: WeatherDashBoardItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String  { get }
}

extension DashBoardViewModelItem {
    var rowCount: Int {
        return 1
    }
    
    var sectionTitle: String{
        return ""
    }
    
}
