//
//  WeeklyViewController.swift
//  WeatherApp
//
//  Created by Ali Karababa on 7.08.2021.
//

import UIKit

class WeeklyViewController: UITableViewController {

    var weather: Weather?
    let cellIdentifier = "DayWeatherCell"
    let maxDayCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(red: 0.5, green: 0.7279, blue: 0.8050, alpha: 1)
        tableView.backgroundView = UIImageView(image: UIImage(named: "first"))
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return maxDayCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? DayWeatherTableViewCell {
            if let weatherData = weather?.data[indexPath.row] {
                cell.update(with: weatherData)
                cell.backgroundColor = UIColor.clear
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    

  

}
