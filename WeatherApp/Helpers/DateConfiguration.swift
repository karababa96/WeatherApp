//
//  DateConfiguration.swift
//  WeatherApp
//
//  Created by Ali Karababa on 7.08.2021.
//

import Foundation


class DateConfiguration {
    class func convertDataToDayName(date: String, identifier: String) -> String {
        var dayName : String!
        let dateFormatterForMainDate = DateFormatter()
        dateFormatterForMainDate.dateFormat = "yyyy-MM-dd"
        let dateFormatterForDay = DateFormatter()
        dateFormatterForDay.dateFormat = identifier
        dateFormatterForDay.locale = Locale(identifier: "en_US")
        
        if let date = dateFormatterForMainDate.date(from: date) {
            dayName = dateFormatterForDay.string(from: date)
        }else {
            print("There was an error decoding the string")
        }
        
        return dayName
    }
}
