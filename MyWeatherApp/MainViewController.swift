//
//  MainViewController.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 12/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var viewModel = MainViewModel()

    class func mainViewController() -> MainViewController
    {
        let ctrl:MainViewController = MainViewController.init(nibName: "MainView", bundle:nil)
        return ctrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.getCurrentWeather()
        
        _ = DataService.shared.weather.observeNext(with: { (weather) in
            if let weather = weather {
                print(weather.first?.name)
                self.cityLabel!.text = weather.first?.name
                self.temperatureLabel!.text = String(describing: Double((weather.first?.temperature)!))
                
            }
            else {
                print("error")
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    
