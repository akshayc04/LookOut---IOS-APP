//
//  WeatherViewController.swift
//  LookOut
//
//  Created by Akshay on 3/19/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class WeatherViewController: UITableViewController {
    

  var data = [WeatherCellView]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let weatherApi = WeatherAPICLient()
        let weatherEndpoint = WeatherEndPoint.tenDayForecat(city: "Syracuse", state: "NY")
        weatherApi.weather(with: weatherEndpoint) { (either) in
            switch either {
            case .value(let forecastText):
                self.data = forecastText.forecastDays.map {
                    WeatherCellView(url: $0.iconUrl, day: $0.day, description: $0.description)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
       
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(red:0.35, green:0.56, blue:0.69, alpha:1.0).cgColor
        let cellview = data[indexPath.row]
        
           cell.textLabel?.text = cellview.day
            cell.detailTextLabel?.text = cellview.description
            cellview.loadImage { (image) in
            cell.imageView?.image = image
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let trans = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = trans
        UIView.animate(withDuration: 0.5){
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
}

