//
//  DustStatusView.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/30.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DustStatusView: UIView {
    
    var imageView: UIImageView!
    var gradeLabel: UILabel!
    var densityLabel: UILabel!
    var timeLabel: UILabel!
    var instrumentLabel: UILabel!
    
    private var gradientColor: CGColor = UIColor(named: "systemWhite")!.cgColor {
        didSet {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                let color = self.gradientColor
                self.gradientLayer.colors = [color, color, color, UIColor(named: "systemWhite")!.cgColor]
            })
        }
    }
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [gradientColor, gradientColor, gradientColor, UIColor(named: "systemWhite")!.cgColor]
        layer.locations = [0, 0.3 ,0.6, 1]
        layer.frame = bounds
        return layer
    }()
    
    private var gradeImage: UIImage? {
        didSet {
            imageView.image = gradeImage
            imageView.layer.shadowColor = UIColor.darkGray.cgColor
            imageView.layer.shadowOffset = .init(width: 0.1, height: 0.1)
            imageView.layer.shadowOpacity = 0.7
        }
    }
    
    var dustInfo = DustInfo(grade: .normal, density: -1, time: Date(), instrument: "-") {
        didSet {
            gradeImage = dustInfo.grade.gradeImage()
            densityLabel.text = "\(dustInfo.density)𝜇g/m³"
            gradeLabel.text = dustInfo.grade.gradeWord()
            instrumentLabel.text = "\(dustInfo.instrument) 측정 기준"
            gradientColor = dustInfo.grade.color()
        }
    }
    
    private func updateGradientLayerColor(with color: CGColor) {
        gradientLayer.colors = [color,color,color, UIColor(named: "systemWhite")!.cgColor]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
