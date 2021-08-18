//
//  Weather.swift
//  WeatherApp
//
//  Created by Ali Karababa on 7.08.2021.
//

import Foundation


struct Weather: Codable {
    
    var cityName: String
    var data : [DailyWeather]
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case data = "data"
    }
}
