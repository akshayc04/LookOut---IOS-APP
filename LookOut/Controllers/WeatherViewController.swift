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

    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count

    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
       let cellview = data[indexPath.row]
        
           cell.textLabel?.text = cellview.day
            cell.detailTextLabel?.text = cellview.description
            cellview.loadImage { (image) in
            cell.imageView?.image = image
            }

        return cell
    }
    
}

