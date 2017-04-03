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
    @IBOutlet weak var imageView: UIImageView!
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
        self.cityLabel.text = ""
        self.temperatureLabel.text = ""
        
        viewModel.getDailyForecast()
        
        _ = DataService.shared.weather.observeNext(with: { (weather) in
            if let weather = weather {
                print(weather)
                self.activityIndicatorView.stopAnimating()
                self.cityLabel.text = weather.city
//                self.temperatureLabel.text = String(describing: (weather.first?.hourForecast.first?.temp)!)
//                let imageName = "sleet.png"
//                let image = UIImage(named: imageName)
//                self.imageView.image = image
                
            }
            else {
                self.activityIndicatorView.stopAnimating()
            }
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityIndicatorView.startAnimating()
        _ = DataService.shared.weather.observeNext(with: { (weather) in
            if weather != nil {
                self.activityIndicatorView.stopAnimating()
            }
            else {
                self.activityIndicatorView.stopAnimating()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    
