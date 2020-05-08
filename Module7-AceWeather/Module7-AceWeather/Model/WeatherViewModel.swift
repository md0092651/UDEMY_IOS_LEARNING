//
//  WeatherViewModel.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 08/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit

class WeatherViewModel : NSObject {
    var items = [DashBoardViewModelItem]()
    
    override init() {
        super.init()
        guard let data = parseJSON() else{ return  }
        
        // START HEADER SECTION
        let header = HeaderViewModelItem(summary: data.currently.summary, currrentCityName: data.timezone, currentTemperature: "\(data.currently.apparentTemperature)", daysLowTemperature: "\(data.daily.data[0].apparentTemperatureLow)", daysHighTemperature: "\(data.daily.data[0].apparentTemperatureHigh)")
        items.append(header)
        // END HEADER SECTION
        
        //TODO :: Change this section of data to collection view with 2 column in 1 row
         // START DETAIL SECTION
        var i = [MoreInfoModel]()
        i.append(MoreInfoModel(title: "Cloud", subTitle: "\(data.currently.cloudCover * 100)", image: #imageLiteral(resourceName: "icons8-thermometer-100")))// TODO ::  change  suitable icon
        i.append(MoreInfoModel(title: "UV Index", subTitle: "\(data.currently.uvIndex)", image: #imageLiteral(resourceName: "icons8-global-warming-100")))
        i.append(MoreInfoModel(title: "Wind Speed", subTitle: "\(data.currently.windSpeed)", image: #imageLiteral(resourceName: "icons8-wind-100")))
        i.append(MoreInfoModel(title: "Wind Direction", subTitle: "NW", image: #imageLiteral(resourceName: "icons8-wind-speed-1-2-100")))// TODO ::  change to dynamic value
        i.append(MoreInfoModel(title: "Sunrise", subTitle: "6:00 AM", image: #imageLiteral(resourceName: "icons8-sunrise-100"))) // TODO ::  change to dynamic value
        i.append(MoreInfoModel(title: "Sunset", subTitle: "7:00 PM", image: #imageLiteral(resourceName: "icons8-sunset-100")))// TODO ::  change to dynamic value
        i.append(MoreInfoModel(title: "Humidity", subTitle: "\(data.currently.humidity * 100)", image: #imageLiteral(resourceName: "icons8-moisture-100")))
        i.append(MoreInfoModel(title: "Rain Chance", subTitle: String(format: "%.1f", data.currently.precipProbability), image: #imageLiteral(resourceName: "icons8-rainy-weather-100")))
        let detail = DetailsModelItem(details: i)
        items.append(detail)
         // END HEADER SECTION
    }
    
    public func dataFromFile(_ filename: String) -> Data? {
        @objc class TestClass: NSObject { }
        let bundle = Bundle(for: TestClass.self)
        if let path = bundle.path(forResource: filename, ofType: "json") {
            return (try? Data(contentsOf: URL(fileURLWithPath: path)))
        }
        return nil
    }
    
    func parseJSON() -> Forecast? {
        let weatherData = dataFromFile("response")!
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Forecast.self, from: weatherData)
            return decodedData
        } catch {
            //            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}


extension WeatherViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .header:
            if let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell {
                cell.item = item
                return cell
            }
        case .details:
            if let item = item as? DetailsModelItem, let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell {
                let detail = item.details[indexPath.row]
                cell.item = detail
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
}
