//
//  DailyViewController.swift
//  WeatherApp
//
//  Created by Ali Karababa on 4.08.2021.
//

import UIKit

class DailyViewController: UIViewController {
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var todayLabel: UILabel!
    
    @IBOutlet weak var backGroundImageView: UIImageView!
    
    @IBOutlet weak var maxTemp: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTemp: UIImageView!
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var windDirectLab: UILabel!
    
    @IBOutlet weak var windImage: UIImageView!
    @IBOutlet weak var windSpeedLab: UILabel!
    
    @IBOutlet weak var sunMaxImage: UIImageView!
    @IBOutlet weak var uvIndexLab: UILabel!
    
    @IBOutlet weak var humidityImage: UIImageView!
    @IBOutlet weak var relativeHumLab: UILabel!
    
    @IBOutlet weak var detailView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backGroundImageViewConfiguration()
        detailViewConfiguration()
    }
    
    public func updateUI(with weather: Weather) {
        guard let today = weather.data.first else {return}
        
        dateLabel.text = DateConfiguration.convertDataToDayName(date: today.datetime, identifier: "d MMM, EEEE")
        temperatureLabel.text = "\(Int(today.temperature))"
        weatherIconImageView.image = today.weatherDescription.icon
        cityNameLabel.text = weather.cityName
        weatherStatusLabel.text = today.weatherDescription.description
        maximumTemperatureLabel.text = "\(Int(today.maxTemperature))"
        minimumTemperatureLabel.text = "\(Int(today.minTemperature))"
        windDirectionLabel.text = today.windDirection
        uvIndexLabel.text = String(format: "%1.f", today.uvIndex)
        windSpeedLabel.text = "\(String(format: "%1.f", today.windSpeed))km/s"
        humidityLabel.text = "%\(today.relativeHumidity)"
    
        updateBackground(with: weather)
        
        print(today.weatherDescription.iconName)
    }
    
    func updateUIForDark() {
        temperatureLabel.textColor = .white
        weatherIconImageView.tintColor = .white
        cityNameLabel.textColor = .white
        weatherStatusLabel.textColor = .white
        maximumTemperatureLabel.textColor = .white
        minimumTemperatureLabel.textColor = .white
        windDirectionLabel.textColor = .white
        uvIndexLabel.textColor = .white
        windSpeedLabel.textColor = .white
        humidityLabel.textColor = .white
        todayLabel.textColor = .white
        maxTemp.tintColor = .white
        maxTempLabel.textColor = .white
        minTemp.tintColor = .white
        minTempLabel.textColor = .white
        locationImage.tintColor = .white
        windDirectLab.textColor = .white
        windImage.tintColor = .white
        windSpeedLab.textColor = .white
        sunMaxImage.tintColor = .white
        uvIndexLab.textColor = .white
        humidityImage.tintColor = .white
        relativeHumLab.textColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    func updateUIForWhite() {
        temperatureLabel.textColor = .black
        weatherIconImageView.tintColor = .black
        cityNameLabel.textColor = .black
        weatherStatusLabel.textColor = .black
        maximumTemperatureLabel.textColor = .black
        minimumTemperatureLabel.textColor = .black
        windDirectionLabel.textColor = .black
        uvIndexLabel.textColor = .black
        windSpeedLabel.textColor = .black
        humidityLabel.textColor = .black
        todayLabel.textColor = .black
        maxTemp.tintColor = .black
        maxTempLabel.textColor = .black
        minTemp.tintColor = .black
        minTempLabel.textColor = .black
        locationImage.tintColor = .black
        windDirectLab.textColor = .black
        windImage.tintColor = .black
        windSpeedLab.textColor = .black
        sunMaxImage.tintColor = .black
        uvIndexLab.textColor = .black
        humidityImage.tintColor = .black
        relativeHumLab.textColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func backGroundImageViewConfiguration() {
        
        backGroundImageView.layer.zPosition = -1
        backGroundImageView.contentMode = .scaleAspectFill
        
        
    }
    
    func detailViewConfiguration() {
        detailView.backgroundColor = UIColor(white: 0, alpha: 0.01)
        detailView.layer.cornerRadius = 10
    }
    
    func updateBackground(with weather: Weather) {
        
        guard let todayInformation = weather.data.first else {return}
        
        
        switch todayInformation.weatherDescription.iconName {
        case "c04n","c03n","c02n","r01n","c01n","a01n","a02n","a03n","a04n","a05n","a06n":
            updateUIForDark()
            backGroundImageView.loadGif(name: "moonCloud")
        case "c01d","c02d","c04d":
            updateUIForWhite()
            backGroundImageView.loadGif(name: "sunCloud1x")
        case "a01d","a02d","a03d","a04d","a05d","a06d":
            updateUIForWhite()
            backGroundImageView.loadGif(name: "sunCloud2x")
        case "t01n","t02n","t03n","t04n","t05n" :
            updateUIForDark()
            backGroundImageView.loadGif(name: "nightThunder")
        case "s01d","s02d","s03d":
            updateUIForWhite()
            backGroundImageView.loadGif(name: "snow")
        case "t04d","t05d":
            updateUIForWhite()
            backGroundImageView.loadGif(name: "thunderCloud")
        case "u00d","u00n", "t01d", "t02d","t03d","d01d","d02d","d03d","r01d","r02d","r03d","r04d","f01d":
            updateUIForDark()
            backGroundImageView.loadGif(name: "rain")
        case "c03d":
            updateUIForWhite()
            backGroundImageView.loadGif(name: "brokenCloud")
        default:
            updateUIForWhite()
        }
    }
}
