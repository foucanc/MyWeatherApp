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
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var viewModel = MainViewModel()

    class func mainViewController() -> MainViewController
    {
        let ctrl:MainViewController = MainViewController.init(nibName: "MainView", bundle:nil)
        return ctrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.getForecast()
        
        _ = DataService.shared.weather.observeNext(with: { (weather) in
            if let weather = weather {
                self.activityIndicatorView.stopAnimating()
                print("Xtemperature: \((weather.first?.forecast.first?.temp)!)")
                self.cityLabel.text = weather.first?.city
                self.temperatureLabel.text = String(describing: (weather.first?.forecast.first?.temp)!)
                
            }
            else {
                self.activityIndicatorView.stopAnimating()
                print("Xerror")
            }
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityIndicatorView.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    
