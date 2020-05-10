//
//  Forecast.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 08/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import Foundation


// MARK: - Forecast
struct Forecast: Decodable {
    let latitude, longitude: Double
    let timezone: String
    let currently: Currently
    let minutely: Minutely
    let hourly: Hourly
    let daily: Daily
    let flags: Flags
    let offset: Int
}

// MARK: - Currently
struct Currently: Decodable {
    let time: Double
    let summary: String
    let icon: Icon
    let nearestStormDistance, nearestStormBearing: Int?
    let precipIntensity, precipProbability, temperature, apparentTemperature: Double
    let dewPoint, humidity, pressure, windSpeed: Double
    let windGust: Double
    let windBearing: Int
    let cloudCover: Double
    let uvIndex: Int
    let visibility, ozone: Double
    let precipType: PrecipType?
}

enum Icon: String, Decodable {
    
           /// A clear day.
           case clearDay = "clear-day"
           
           /// A clear night.
           case clearNight = "clear-night"
           
           /// A rainy day or night.
           case rain = "rain"
           
           /// A snowy day or night.
           case snow = "snow"
           
           /// A sleety day or night.
           case sleet = "sleet"
           
           /// A windy day or night.
           case wind = "wind"
           
           /// A foggy day or night.
           case fog = "fog"
           
           /// A cloudy day or night.
           case cloudy = "cloudy"
           
           /// A partly cloudy day.
           case partlyCloudyDay = "partly-cloudy-day"
           
           /// A partly cloudy night.
           case partlyCloudyNight = "partly-cloudy-night"
}

enum PrecipType: String, Decodable {
     /// Rainy.
           case rain = "rain"
           
           /// Snowy.
           case snow = "snow"
           
           /// Sleet, freezing rain, ice pellets, or wintery mix.
           case sleet = "sleet"
           
           /// Haily.
           case hail = "hail"
}

enum Summary: String, Decodable {
    case clear = "Clear"
    case mostlyCloudy = "Mostly Cloudy"
    case overcast = "Overcast"
    case partlyCloudy = "Partly Cloudy"
}

// MARK: - Daily
struct Daily: Decodable {
    let summary: String
    let icon: PrecipType
    let data: [DailyDatum]
}

// MARK: - DailyDatum
struct DailyDatum: Decodable {
    let time: Int
    let summary, icon: String
    let sunriseTime, sunsetTime: Double
    let moonPhase, precipIntensity, precipIntensityMax: Double
    let precipIntensityMaxTime: Int
    let precipProbability: Double
    let precipType: PrecipType
    let temperatureHigh: Double
    let temperatureHighTime: Double
    let temperatureLow: Double
    let temperatureLowTime: Double
    let apparentTemperatureHigh: Double
    let apparentTemperatureHighTime: Int
    let apparentTemperatureLow: Double
    let apparentTemperatureLowTime: Int
    let dewPoint, humidity, pressure, windSpeed: Double
    let windGust: Double
    let windGustTime, windBearing: Int
    let cloudCover: Double
    let uvIndex, uvIndexTime: Int
    let visibility, ozone, temperatureMin: Double
    let temperatureMinTime: Int
    let temperatureMax: Double
    let temperatureMaxTime: Int
    let apparentTemperatureMin: Double
    let apparentTemperatureMinTime: Int
    let apparentTemperatureMax: Double
    let apparentTemperatureMaxTime: Int
    
}

extension DailyDatum{
    func getSunRiseString() -> String {
        return DateUtility.formatUnixDate(withFormat: DateFormat.HH_mm, unixTimeStamp: sunriseTime)
    }
    
    func getSunsetString() -> String {
        return DateUtility.formatUnixDate(withFormat: DateFormat.HH_mm, unixTimeStamp: sunsetTime)
    }
}

// MARK: - Flags
struct Flags: Decodable {
    let sources: [String]
    let nearestStation: Double
    let units: String

    enum CodingKeys: String, CodingKey {
        case sources
        case nearestStation = "nearest-station"
        case units
    }
}

// MARK: - Hourly
struct Hourly: Decodable {
    let summary: String
    let icon: Icon
    let data: [Currently]
}

// MARK: - Minutely
struct Minutely: Decodable {
    let summary: String
    let icon: Icon
    let data: [MinutelyDatum]
}

// MARK: - MinutelyDatum
struct MinutelyDatum: Decodable {
    let time, precipIntensity, precipProbability: Int
}
