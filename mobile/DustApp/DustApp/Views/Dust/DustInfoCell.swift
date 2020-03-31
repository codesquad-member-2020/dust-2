//
//  DustInfoCell.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/30.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DustInfoCell: UITableViewCell {
    
    static let identifier = "DustInfo"
    
    @IBOutlet weak var densityBar: UIView!
    @IBOutlet weak var densityLabel: UILabel!
    
    private let maxDensity: Int = 200
    
    var dustInfo: DustInfo = DustInfo(density: 0) {
        didSet { updateView() }
    }
    
    private func updateDensityBar() {
        let density = dustInfo.density > maxDensity ? maxDensity : dustInfo.density
        let ratio: CGFloat = CGFloat(density) / CGFloat(maxDensity)
        let densityBarWidth = contentView.frame.width * ratio
        densityBar.widthAnchor.constraint(equalToConstant: densityBarWidth).isActive = true
        densityBar.backgroundColor = UIColor(cgColor: dustInfo.grade.color())
        updateDensityLabel(densityBarWidth: densityBarWidth)
    }
    
    private func updateDensityLabel(densityBarWidth: CGFloat) {
        densityLabel.text = String(dustInfo.density)
        densityLabel.textColor = densityBarWidth > densityLabel.frame.maxX ? .white : .darkGray
    }
    
    private func updateView() {
        updateDensityBar()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
