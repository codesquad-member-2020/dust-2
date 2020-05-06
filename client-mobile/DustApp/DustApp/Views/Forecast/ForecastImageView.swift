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
    private var isPlaying: Bool = false
    
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
        viewModel?.index += 1
        image = viewModel?.image(at: viewModel!.index)
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime) {
            if self.isPlaying {
                self.play()
            }
        }
    }
    
    private func pause() {
        isPlaying = false
    }
}
