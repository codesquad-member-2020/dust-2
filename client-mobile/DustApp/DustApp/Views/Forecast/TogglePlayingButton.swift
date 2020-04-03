//
//  TogglePlayingButton.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class TogglePlayingButton: UIButton {
    
    var isPlaying: Bool = false {
        didSet {
            let image: UIImage? = isPlaying ? UIImage(named: "pause.fill") : UIImage(named: "play.fill")
            setImage(image, for: .normal)
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
        isEnabled = false
        layer.borderColor = UIColor(named: "systemBlack")?.cgColor
        layer.borderWidth = 1
    }
}
