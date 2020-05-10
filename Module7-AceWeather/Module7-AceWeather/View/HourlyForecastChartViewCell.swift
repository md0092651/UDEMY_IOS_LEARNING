//
//  HourlyForecastChartViewCell.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 10/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit
import Charts

class HourlyForecastChartViewCell: UITableViewCell {
    
    enum GraphType: Int {
        case TEMPERATURE = 0
        case WIND = 1
    }
    @IBOutlet weak var tempBtn: UIButton!
    @IBOutlet weak var windBtn: UIButton!
    @IBOutlet weak var chart: LineChartView!
    
    var item: DashBoardViewModelItem? {
        didSet {
            guard let item = item as? HourlyForecast else {
                return
            }
            setChartData(item.details,type: GraphType.TEMPERATURE)
        }
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        let currentTitle = sender.currentTitle
        var typeSelected: GraphType
        if currentTitle == "Temperature"{
            tempBtn.addBottomBorderWithColor(color: .blue, width: 1)
            windBtn.addBottomBorderWithColor(color: .white, width: 1)
            typeSelected = GraphType.TEMPERATURE
        }else{
            windBtn.addBottomBorderWithColor(color: .blue, width: 1)
            tempBtn.addBottomBorderWithColor(color: .white, width: 1)
            typeSelected = GraphType.WIND
        }
        
        if case let i as HourlyForecast = item {
            let d = i.details
            setChartData(d,type: typeSelected)
        }
    }
    
    func setChartData(_ item : [Currently], type:GraphType)  {
        let values = (0..<item.count).map { (i) -> ChartDataEntry in
            if type == GraphType.TEMPERATURE{
                return ChartDataEntry(x: Double(i), y: item[i].apparentTemperature)
            }else{
                return ChartDataEntry(x: Double(i), y: item[i].windSpeed)
            }
        }
        let xvalues = (0..<item.count).map {(i) -> String in
            return DateUtility.formatUnixDate(withFormat: DateFormat.HH_mm, unixTimeStamp: item[i].time)
        }
        
        let chartsFormatterDateShort = ChartsFormatterDateShort(labels: xvalues)
        chart.xAxis.valueFormatter = chartsFormatterDateShort
        
        let set1 = LineChartDataSet(entries: values, label: "Hourly Data")
        set1.drawIconsEnabled = false
        
        set1.lineDashLengths = [5, 2.5]
        set1.highlightLineDashLengths = [5, 2.5]
        set1.setColor(.cyan)
        set1.setCircleColor(.black)
        set1.lineWidth = 1
        set1.circleRadius = 3
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 9)
        set1.formLineDashLengths = [5, 2.5]
        set1.formLineWidth = 1
        set1.formSize = 15
        
        
        let gradientColors = [ChartColorTemplates.colorFromString("#FFFFFF").cgColor,
                              ChartColorTemplates.colorFromString("#33F6FF").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90)
        set1.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set1)
        
        chart.data = data
        chart.setVisibleXRangeMaximum(10)
        chart.scaleYEnabled = false
        chart.scaleXEnabled = true
     

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tempBtn.addBottomBorderWithColor(color: .blue, width: 1)
        
        chart.chartDescription?.enabled = false
        chart.dragEnabled = true
        chart.setScaleEnabled(true)
        chart.pinchZoomEnabled = true
        chart.rightAxis.enabled = false
        chart.leftAxis.enabled = false
        chart.xAxis.enabled = true
        chart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        chart.animate(xAxisDuration: 1.5)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension HourlyForecastChartViewCell : ChartViewDelegate{
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
    }
}


class ChartsFormatterDateShort: IAxisValueFormatter {
    var labels: [String] = []
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        print(value)
        
        return labels[Int(value)]
    }
    
    init(labels: [String]) {
        
        self.labels = labels
    }
}

