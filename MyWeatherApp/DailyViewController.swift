//
//  DailyViewController.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 30/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController {
    
    class func dailyViewController() -> DailyViewController
    {
        let ctrl:DailyViewController = DailyViewController.init(nibName: "DailyView", bundle:nil)
        return ctrl
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
