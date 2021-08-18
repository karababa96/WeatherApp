//
//  WeatherProvider.swift
//  WeatherApp
//
//  Created by Ali Karababa on 7.08.2021.
//

import Foundation
import UIKit

class WeatherProvider {
    
    private let apiKey = "4317c55eb53640b3835daf15acd7d9a1"
    private let baseURL = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily")
    private let jsonDecoder = JSONDecoder()
    
    
    

    func getWeather(completion: @escaping (Weather?) -> Void) {
        
        
        guard let cityName = UserDefaults.standard.object(forKey: "cityName") as? String else {return}
        
        
       
        
        let requestURL = URLRequest(url: URL(string: "https://api.weatherbit.io/v2.0/forecast/daily?city=\(cityName)&key=4317c55eb53640b3835daf15acd7d9a1")!)
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            guard let weatherData = data else {
                completion(nil)
                return
            }
            
            do {
                let weather = try self.jsonDecoder.decode(Weather.self, from: weatherData)
                
                DispatchQueue.main.async {
                    
                    completion(weather)
                }
            } catch {
                completion(nil)
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
