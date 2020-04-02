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
    @IBOutlet weak var densityBarWidthConstraint: NSLayoutConstraint!
    
    private let densityLabelColor = UIColor(named: "densityLabelColor")!
    private let coveredDensityLabelColor = UIColor(named: "densityLabelColor-covered")!
    
    private let maxDensity: Int = 200
    
    private func updateDensityBar(to densityBarWidth: CGFloat, grade: DustInfo.Grade) {
        densityBarWidthConstraint.constant = densityBarWidth
        UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.densityBar.layoutIfNeeded()
        })
        densityBar.backgroundColor = UIColor(cgColor: grade.color())
    }
    
    private func updateDensityLabel(density: Int, densityBarWidth: CGFloat) {
        densityLabel.text = String(density)
        densityLabel.textColor = densityBarWidth < densityLabel.frame.maxX ? densityLabelColor : coveredDensityLabelColor
    }
    
    func updateCell(with dustInfo: DustInfo) {
        let density = dustInfo.density > maxDensity ? maxDensity : dustInfo.density
        let ratio: CGFloat = CGFloat(density) / CGFloat(maxDensity)
        let densityBarWidth = contentView.frame.width * ratio
        updateDensityBar(to: densityBarWidth, grade: dustInfo.grade)
        updateDensityLabel(density: dustInfo.density, densityBarWidth: densityBarWidth)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        densityBar.setNeedsLayout()
        densityBarWidthConstraint.constant = 0
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.densityBar.layoutIfNeeded()
        })
    }
    
    override func prepareForReuse() {
        densityBar.setNeedsLayout()
        densityBarWidthConstraint.constant = 0
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.densityBar.layoutIfNeeded()
        })
    }
}
