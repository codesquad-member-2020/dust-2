//
//  ForecastImageView.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ForecastImageView: UIImageView {
    
    var viewModel: ForecastViewModel?
    private let durationTime: Double = 1
    var isPlaying: Bool = false
    
    func configureImage(image: UIImage?) {
        self.image = image
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
            self.viewModel?.index += 1
            self.image = self.viewModel?.image(at: self.viewModel!.index)
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
