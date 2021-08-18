//
//  CityPickerViewController.swift
//  WeatherApp
//
//  Created by Ali Karababa on 17.08.2021.
//

import UIKit

class CityPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    

    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var selectedCityName = String()
    
    let backGroundView : UIImageView = {
        let backGroundView = UIImageView(frame: .zero)
        return backGroundView
    }()
    
    let cityNames = ["Adana","Adiyaman","Afyon","Agri","Aksaray","Amasya","Ankara","Antalya","Ardahan","Artvin","Aydin","Balikesir","Bartin","Batman","Bayburt","Bilecik","Bingol","Bitlis","Bolu","Burdur","Bursa","Canakkale","Cankiri","Corum","Denizli","Diyarbakir","Duzce","Edirne","Elazig","Erzincan","Erzurum","Eskisehir","Gaziantep","Giresun","Gumushane","Hakkari","Hatay","Igdir","Isparta","Istanbul","Izmir","Kahramanmaras","Karabuk","Karaman","Kars","Kastamonu","Kayseri","Kilis","Kirikkale","Kirklareli","Kirsehir","Kocaeli","Konya","Kutahya","Malatya","Manisa","Mardin","Mersin","Mugla","Mus","Nevsehir","Nigde","Ordu","Osmaniye","Rize","Sakarya","Samsun","Sanliurfa","Siirt","Sinop","Sirnak","Sivas","Tekirdag","Tokat","Trabzon","Tunceli","Usak","Van","Yalova","Yozgat","Zonguldak"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewConfiguration()
        backGroundViewConfiguration()
        showButtonConfiguration()
        navigationControllerConfiguration()
    }
    
    func pickerViewConfiguration() {
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        cityPickerView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        cityPickerView.tintColor = .white
        cityPickerView.layer.cornerRadius = 10
    }
    
    func backGroundViewConfiguration() {
        backGroundView.frame = view.bounds
        backGroundView.image = UIImage(named: "first")
        backGroundView.layer.zPosition = -1
        view.addSubview(backGroundView)
    }
    
    func showButtonConfiguration() {
        showButton.backgroundColor = UIColor(white: 0, alpha: 0.3)
        showButton.layer.cornerRadius = 10
        showButton.tintColor = .white
    }
    
    func navigationControllerConfiguration() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let sorted = cityNames.sorted { (a, b) -> Bool in
            b > a
        }
       
        return sorted[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCityName = cityNames[row]
       
        
    }
    
    @IBAction func showWeatherButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "WeatherPageViewController") else {return}
        navigationController?.pushViewController(vc, animated: true)
        print("SelectedCityName: \(self.selectedCityName)")
        UserDefaults.standard.setValue(selectedCityName, forKey: "cityName")
    }
    

}
