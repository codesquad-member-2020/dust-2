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
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    let viewModel = ForecastViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModelCompletionHandler()
        
        requestForecastImages()
    }
    
    private func requestForecastImages() {
        viewModel.requestImages()
        activityIndicatorView.startAnimating()
    }
    
    private func configureViewModelCompletionHandler() {
        viewModel.downloadImagesCompletion = { (hasDownloaded, images) in
            guard hasDownloaded else { return }
            guard let images = images else { return }
            DispatchQueue.main.async {
                self.disableActivityIndicatorView()
                self.enableViews(with: images)
            }
        }
    }
    
    private func disableActivityIndicatorView() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }
    
    private func enableViews(with images: [UIImage]) {
        self.enableButton()
        self.enableSlider(images: images)
        self.imageView.configureImages(images: images)
    }
    
    private func enableButton() {
        self.togglePlayingButton.isEnabled = true
    }
    
    private func enableSlider(images: [UIImage]) {
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
