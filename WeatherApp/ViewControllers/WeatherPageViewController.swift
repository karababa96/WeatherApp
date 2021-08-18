//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ali Karababa on 4.08.2021.
//

import UIKit




class WeatherPageViewController: UIPageViewController {

    enum Appearance: Int {
        case daily
        case weekly
    }
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    lazy var dailyViewController: DailyViewController = {
        return storyboard!.instantiateViewController(identifier: "DailyViewController")
    }()
    
    lazy var weeklyViewController: WeeklyViewController = {
        return storyboard!.instantiateViewController(identifier: "WeeklyViewController")
    }()
    
    var managedControllers: [UIViewController] {
        return [dailyViewController, weeklyViewController]
    }
    
    
    var currentAppearance: Appearance = .daily
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        updateCurrentController(animated: false)
        let weatherProvider = WeatherProvider()
        weatherProvider.getWeather() { (weather) in
            guard let weather = weather else {return}
            self.dailyViewController.updateUI(with: weather)
            self.weeklyViewController.weather = weather
        }
    }

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if let newAppearance = Appearance(rawValue: segmentedControl.selectedSegmentIndex) {
            self.currentAppearance = newAppearance
            updateCurrentController(animated: true)
        }
    }
    
   public func updateCurrentController(animated: Bool) {
        switch currentAppearance {
        case .daily:
            setViewControllers([dailyViewController], direction: .reverse, animated: animated, completion: nil)
        case .weekly:
            setViewControllers([weeklyViewController], direction: .forward, animated: animated, completion: nil)
        }
    }
    
}

