//
//  ForecastImageView.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ForecastImageView: UIImageView {
    
    private let durationTime: Double = 1
    
    var isPlaying: Bool = false

    private var images: [UIImage] = [] { didSet { image = images.first } }
    
    var index: Int = 0 {
        didSet {
            index = index >= images.count ? 0 : index
            indexHasChanged?(Float(index))
            guard !isPlaying else { return }
            image = images[index]
        }
    }
    
    var indexHasChanged: ((Float) -> Void)?
    
    func configureImages(images: [UIImage]) {
        self.images = images
    }
    
    func togglePlaying() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
    
    private func play() {
        isPlaying = true
        UIView.transition(with: self, duration: durationTime, options: .transitionCrossDissolve, animations: {
            self.index += 1
            self.image = self.images[self.index]
        }, completion: { _ in
            if self.isPlaying {
                self.play()
            }
        })
    }
    
    private func pause() {
        isPlaying = false
    }
}
