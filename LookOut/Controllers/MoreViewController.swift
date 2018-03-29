//
//  MoreViewController.swift
//  LookOut
//
//  Created by Akshay on 3/22/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var busBtn: UIButton!
    @IBOutlet weak var weatherBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func weatherBtnTapped(_ sender: UIButton) {
        //performSegue(withIdentifier: "weather", sender: self)
        let WeatherController = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        self.navigationController?.pushViewController(WeatherController, animated: true)
        
    }
    
    @IBAction func busBtnTapped(_ sender: UIButton) {
        
        let BusController = self.storyboard?.instantiateViewController(withIdentifier: "BusViewController") as! BusViewController
        self.navigationController?.pushViewController(BusController, animated: true)
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
