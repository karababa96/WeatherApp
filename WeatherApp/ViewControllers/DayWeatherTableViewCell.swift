//
//  DayWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Ali Karababa on 4.08.2021.
//

import UIKit

class DayWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    
    func update(with weather: DailyWeather) {
        dayNameLabel.text = DateConfiguration.convertDataToDayName(date: weather.datetime, identifier: "EEEE")
        iconImageView.image = weather.weatherDescription.icon
        maximumTemperatureLabel.text = "\(Int(weather.maxTemperature))"
        minimumTemperatureLabel.text = "\(Int(weather.minTemperature))"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
  

}
