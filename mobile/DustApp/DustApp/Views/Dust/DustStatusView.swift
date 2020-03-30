//
//  DustStatusView.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/30.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DustStatusView: UIView {
    
    var gradeLabel: UILabel!
    var densityLabel: UILabel!
    var timeLabel: UILabel!
    var instrumentLabel: UILabel!
    
    private var gradientColor: CGColor = UIColor.white.cgColor {
        didSet {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                let color = self.gradientColor
                self.gradientLayer.colors = [color,color,color, UIColor.white.cgColor]
            })
        }
    }
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [gradientColor, gradientColor, gradientColor, UIColor.white.cgColor]
        layer.locations = [0, 0.3 ,0.6, 1]
        layer.frame = bounds
        return layer
    }()
    
    var dustInfo = DustInfo(grade: .normal, density: -1, time: Date(), instrument: "-") {
        didSet {
            densityLabel.text = "\(dustInfo.density)𝜇g/m³"
            gradeLabel.text = gradeWord()
            instrumentLabel.text = "\(dustInfo.instrument) 측정 기준"
            gradientColor = color()
        }
    }
    
    private func updateGradientLayerColor(with color: CGColor) {
        gradientLayer.colors = [color,color,color, UIColor.white.cgColor]
    }
    
    private func gradeWord() -> String {
        switch dustInfo.grade {
            case .worst: return "매우 나쁨"
            case .bad: return "나쁨"
            case .normal: return "보통"
            case .good: return "좋음"
            case .none: return "-"
        }
    }
    
    private func color() -> CGColor {
        switch dustInfo.grade {
        case .worst: return #colorLiteral(red: 0.9960784314, green: 0.2078431373, blue: 0.137254902, alpha: 1).cgColor
        case .bad: return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor
        case .normal: return #colorLiteral(red: 0, green: 0.8549019608, blue: 0.5254901961, alpha: 1).cgColor
        case .good: return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
        case .none: return UIColor.red.cgColor
        }
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
