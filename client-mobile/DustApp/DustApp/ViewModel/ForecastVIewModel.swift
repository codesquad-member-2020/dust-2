//
//  ForecastVIewModel.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ForecastViewModel {
    
    var images: [UIImage] = []
    var hasDownloaded: Bool = false { didSet { downloadImagesCompletion?(hasDownloaded, images) } }
    var isPlaying: Bool = false { didSet { playingStatusHasChanged?(isPlaying) } }
    var index: Int = 0 {
        didSet {
            index = index >= images.count ? 0 : index
            indexHasChanged?(index)
        }
    }
    
    var downloadImagesCompletion: ((Bool, [UIImage]?) -> Void)?
    var playingStatusHasChanged: ((Bool) -> Void)?
    var indexHasChanged: ((Int) -> Void)?
    
    func image(at index: Int) -> UIImage {
        images[index]
    }
    
    func togglePlaying() {
        isPlaying = !isPlaying
    }
    
    func requestImages() {
        let imageURLStrings = ForecastNetworkManager.shared.URLStrings
        var placeholderImages = Array<UIImage?>(repeating: nil, count: imageURLStrings.count)
        var hasNilImage = true
        
        for (index, imageURLString) in imageURLStrings.enumerated() {
            ForecastNetworkManager.shared.requestData(with: imageURLString) { (data, error) in
                if let error = error { print(error); return }
                guard let data = data else { return }
                guard let image = UIImage(data: data) else { return }
                placeholderImages[index] = image
                placeholderImages.forEach { hasNilImage = ($0 == nil) }
                if !hasNilImage {
                    self.images = placeholderImages.map{ $0! }
                    self.hasDownloaded = true
                }
            }
        }
    }
}