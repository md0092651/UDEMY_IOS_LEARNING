//
//  StringExtension.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 11/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    
}
