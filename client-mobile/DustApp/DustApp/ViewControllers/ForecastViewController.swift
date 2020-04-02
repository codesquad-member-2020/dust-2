//
//  ForecastViewController.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/01.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var regionalGradeLabel: UILabel!
    
    let images = [#imageLiteral(resourceName: "icon-bad"), #imageLiteral(resourceName: "icon-worst"), #imageLiteral(resourceName: "icon-normal"), #imageLiteral(resourceName: "icon-good")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = images.first
    }
    
    @IBAction func togglePlayingForecastTapped(_ sender: Any) {
        if imageView.isAnimating {
            imageView.stopAnimating()
        } else {
            imageView.animationImages = images
            imageView.animationDuration = 0.25 * Double(images.count)
            imageView.startAnimating()
        }
    }
}
