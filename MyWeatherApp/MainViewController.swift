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
    @IBOutlet weak var mainWeatherLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var dailyForecastCollectionView: UICollectionView!
    
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
        self.mainWeatherLabel.text = ""

        dailyForecastCollectionView.register(UINib(nibName: "DailyForecastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "dailyForecastCell")
        dailyForecastCollectionView.delegate = self
        dailyForecastCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        dailyForecastCollectionView.collectionViewLayout = layout
        
        //viewModel.getDailyForecast()
        viewModel.getCurrentWeather()
        
        _ = DataService.shared.weather.observeNext(with: { (weather) in
            if let weather = weather {
                print("MAIN VC: \(weather)")
                print("icon: \(String(describing: weather.weatherCondition.first?.icon))")
                self.activityIndicatorView.stopAnimating()
                self.cityLabel.text = weather.city
                self.temperatureLabel.text = String(weather.temp) + " °C"
                self.mainWeatherLabel.text = weather.weatherCondition.first?.main
                let imageName = "sleet.png"
                let image = UIImage(named: imageName)
                self.imageView.image = image
                self.dailyForecastCollectionView.reloadData()
                
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

// MARK: CollectionView

extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dailyForecastCell", for: indexPath) as! DailyForecastCollectionViewCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
