//
//  ForecastVIewModel.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ForecastViewModel {
    
    var images: [UIImage]?
    var hasDownloaded: Bool = false {
        didSet { downloadImagesCompletion?(hasDownloaded, images) }
    }
    
    var downloadImagesCompletion: ((Bool, [UIImage]?) -> Void)?
    
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
