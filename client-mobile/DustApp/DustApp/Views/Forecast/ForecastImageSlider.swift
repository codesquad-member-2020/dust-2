//
//  ForecastImageSlider.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ForecastImageSlider: UISlider {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        isEnabled = false
        minimumValue = 0
        value = 0
    }
    
    func configureMaximumValue(count: Int) {
        maximumValue = Float(count)
    }
}
