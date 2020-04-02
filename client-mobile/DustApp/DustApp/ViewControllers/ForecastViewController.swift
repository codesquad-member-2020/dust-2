//
//  ForecastViewController.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/01.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    @IBOutlet weak var imageView: ForecastImageView!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var regionalGradeLabel: UILabel!
    @IBOutlet weak var togglePlayingButton: TogglePlayingButton!
    @IBOutlet weak var imageSlider: ForecastImageSlider!
    
    let viewModel = ForecastViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModelCompletionHandler()
        viewModel.requestImages()
    }
    
    private func configureViewModelCompletionHandler() {
        viewModel.downloadImagesCompletion = { (hasDownloaded, images) in
            guard hasDownloaded else { return }
            guard let images = images else { return }
            self.EnableButton()
            self.EnableSlider(images: images)
            self.imageView.configureImages(images: images)
        }
    }
    
    private func EnableButton() {
        self.togglePlayingButton.isEnabled = true
    }
    
    private func EnableSlider(images: [UIImage]) {
        self.imageSlider.isEnabled = true
        self.imageSlider.configureMaximumValue(count: images.count - 1)
    }
    
    @IBAction func togglePlayingForecastTapped(_ sender: Any) {
        imageView.toggleAnimating()
        togglePlayingButton.isPlaying = !togglePlayingButton.isPlaying
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        guard viewModel.hasDownloaded else { return }
        imageView.index = Int(imageSlider.value)
    }
}
