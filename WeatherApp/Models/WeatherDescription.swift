//
//  WeatherDescription.swift
//  WeatherApp
//
//  Created by Ali Karababa on 7.08.2021.
//

import Foundation
import UIKit


struct WeatherDescription : Codable {
    // MARK: - Properties
    
    var iconName:  String
    var description: String
    
    
    var icon: UIImage? {
        
        switch iconName {
        case "t01d", "t02d", "t03d":
            return UIImage(systemName: "cloud.sun.bolt.fill")
        case "t04d", "t05d":
            return UIImage(systemName: "cloud.bolt.fill")
        case "d01d", "d02d", "d03d", "s01d", "s01n", "s02d", "s02n", "s03d", "s03n", "s06d", "s06n":
            return UIImage(systemName: "cloud.snow.fill")
        case "r01d", "r02d","r04d", "r04n","f01d", "f01n", "r06d":
            return UIImage(systemName: "cloud.drizzle.fill")
        case "r03d", "r03n":
            return UIImage(systemName: "cloud.heavyrain.fill")
        case "r05d":
            return UIImage(systemName: "cloud.sun.rain.fill")
        case "r05n", "r06n", "t01n", "t02n", "t03n":
            return UIImage(systemName: "cloud.moon.rain.fill")
        case "s04d", "s04n":
            return UIImage(systemName: "cloud.sleet.fill")
        case "s05d", "s05n":
            return UIImage(systemName: "wind")
        case "a01d", "a02d", "a03d", "a04d", "a05d", "a06d":
            return UIImage(systemName: "cloud.fog")
        case "a01n", "a02n", "a03n", "a04n", "a05n", "a06n":
            return UIImage(systemName: "cloud.fog.fill")
        case "c01d":
            return UIImage(systemName: "sun.max.fill")
        case "c01n":
            return UIImage(systemName: "moon.circle.fill")
        case "c02d":
            return UIImage(systemName: "cloud.sun.fill")
        case "c03d","c03n", "c04d", "c04n":
            return UIImage(systemName: "cloud.fill")
        default:
            return UIImage(systemName: "")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case iconName = "icon"
        case description = "description"
    }
    
    
}
