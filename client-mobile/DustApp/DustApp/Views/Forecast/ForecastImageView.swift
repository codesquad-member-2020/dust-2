//
//  ForecastImageView.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ForecastImageView: UIImageView {

    var images: [UIImage]? {
        didSet {
            animationImages = images
            animationDuration = 0.25 * Double(images?.count ?? 0)
            image = images?.first
        }
    }
    
    var index: Int = 0 {
        didSet {
            image = images?[index]
        }
    }
    
    func toggleAnimating() {
        if isAnimating {
            stopAnimating()
        } else {
            startAnimating()
        }
    }
}
