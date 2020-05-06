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
    private var hasAnimated = false
    private let densityLabelColor = UIColor(named: "densityLabelColor")!
    private let coveredDensityLabelColor = UIColor(named: "densityLabelColor-covered")!
    
    private let maxDensity: Int = 200
    private var densityBarWidth: CGFloat = 0
    
    private func updateDensityBar(to densityBarWidth: CGFloat, grade: DustInfo.Grade) {
        densityBar.backgroundColor = UIColor(cgColor: grade.color())
        guard !hasAnimated else {
            densityBar.frame = .init(x: 0, y: 0, width: densityBarWidth, height: DustInfoListDelegate.cellHeight)
            return
        }
        UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.densityBar.frame = .init(x: 0, y: 0, width: densityBarWidth, height: DustInfoListDelegate.cellHeight)
        }, completion: { _ in
            self.hasAnimated = true
        })
    }
    
    private func updateDensityLabel(density: Int, densityBarWidth: CGFloat) {
        densityLabel.text = String(density)
        densityLabel.textColor = densityBarWidth < densityLabel.frame.maxX ? densityLabelColor : coveredDensityLabelColor
    }
    
    func updateCell(with dustInfo: DustInfo) {
        let density = dustInfo.density > maxDensity ? maxDensity : dustInfo.density
        let ratio: CGFloat = CGFloat(density) / CGFloat(maxDensity)
        self.densityBarWidth = contentView.frame.width * ratio
        updateDensityBar(to: densityBarWidth, grade: dustInfo.grade)
        updateDensityLabel(density: dustInfo.density, densityBarWidth: densityBarWidth)
    }
    
    func initializeAnimation() {
        hasAnimated = false
        densityBar.frame = .init(x: 0, y: 0, width: 0, height: DustInfoListDelegate.cellHeight)
        UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.densityBar.frame = .init(x: 0, y: 0, width: self.densityBarWidth, height: DustInfoListDelegate.cellHeight)
        }, completion: { _ in
            self.hasAnimated = true
        })
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        densityBar.frame = .init(x: 0, y: 0, width: 0, height: DustInfoListDelegate.cellHeight)
    }
    
    override func prepareForReuse() {
        densityBar.frame = .init(x: 0, y: 0, width: 0, height: DustInfoListDelegate.cellHeight)
    }
}
