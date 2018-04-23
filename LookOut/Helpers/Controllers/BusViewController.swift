//
//  BusViewController.swift
//  LookOut
//
//  Created by Akshay on 3/28/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit


class BusViewController: UICollectionViewController, EFImageViewZoomDelegate {
    
    var arrimg = [#imageLiteral(resourceName: "js"),#imageLiteral(resourceName: "euclid"),#imageLiteral(resourceName: "nh"),#imageLiteral(resourceName: "ec"),#imageLiteral(resourceName: "ConnectiveCorridor"),#imageLiteral(resourceName: "destinyFreeWeekend"),#imageLiteral(resourceName: "destinyPaid"),#imageLiteral(resourceName: "drumlins"),#imageLiteral(resourceName: "Quad Shuttle"),#imageLiteral(resourceName: "SUwestcott"),#imageLiteral(resourceName: "Warehouse")]
    var arrtext = ["James Street", "Euclid Shuttle", "Nob Hill", "East Campus", "Connective Corridor", "Destiny Free Shuttle", "Destiny-Centro", "Drumlins", "QuadShuttle", "SU-Westcott", "Warehouse"]



    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
  
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrimg.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusCell", for: indexPath)

        
        let celltext = cell.viewWithTag(1) as! UILabel
        let cellImage = cell.viewWithTag(2) as! UIImageView
        
        celltext.text = arrtext[indexPath.row]
        cellImage.image = arrimg[indexPath.row]

    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageView = EFImageViewZoom()
        
        imageView.image = arrimg[indexPath.row]
        imageView._delegate = self
        imageView._minimumZoomScale = 1.0
        imageView._maximumZoomScale = 6.0
        imageView.frame = self.view.frame
        imageView.backgroundColor = UIColor(red:0.35, green:0.56, blue:0.69, alpha:1.0)
        imageView.contentMode = .center
        imageView.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)

        self.view.addSubview(imageView)
        
        
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }

}
