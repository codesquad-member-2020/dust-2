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
        configureImageViewViewModel()
        configureViewModelHandlers()
        requestForecastImages()
    }
    
    private func configureImageViewViewModel() {
        imageView.viewModel = viewModel
    }
    
    private func configureViewModelHandlers() {
        configureViewModelImageDownloadHandler()
        configureViewModelIndexHandler()
        configureViewModelPlayingStatusHandler()
    }
    
    private func requestForecastImages() {
        viewModel.requestImages()
        activityIndicatorView.startAnimating()
    }
    
    private func configureViewModelImageDownloadHandler() {
        viewModel.downloadImagesCompletion = { (hasDownloaded, forecast, images) in
            guard hasDownloaded else { return }
            guard let forecast = forecast else { return }
            guard let images = images else { return }
            DispatchQueue.main.async {
                self.updateLabels(with: forecast)
                self.disableActivityIndicatorView()
                self.enableViews(with: images)
            }
        }
    }
    
    private func updateLabels(with forecast: Forecast) {
        forecastLabel.text = forecast.forecastSummary
        regionalGradeLabel.text = forecast.allGradesSummary
    }
    
    private func configureViewModelIndexHandler() {
        viewModel.indexHasChanged = { index in
            self.imageView.image = self.viewModel.image(at: index)
            self.imageSlider.value = Float(index)
        }
    }
    
    private func configureViewModelPlayingStatusHandler() {
        viewModel.playingStatusHasChanged = { isPlaying in
            self.togglePlayingButton.isPlaying = isPlaying
            self.imageView.togglePlaying()
        }
    }
    
    private func disableActivityIndicatorView() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }
    
    private func enableViews(with images: [UIImage]) {
        self.enableButton()
        self.enableSlider(images: images)
        self.imageView.configureImage(image: images.first)
    }
    
    private func enableButton() {
        self.togglePlayingButton.isEnabled = true
    }
    
    private func enableSlider(images: [UIImage]) {
        self.imageSlider.isEnabled = true
        self.imageSlider.configureMaximumValue(count: images.count - 1)
    }
    
    @IBAction func togglePlayingForecastTapped(_ sender: Any) {
        viewModel.togglePlaying()
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        guard viewModel.hasDownloaded else { return }
        viewModel.index = Int(imageSlider.value)
    }
}
