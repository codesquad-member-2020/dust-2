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
        images = [#imageLiteral(resourceName: "icon-bad"), #imageLiteral(resourceName: "icon-worst"), #imageLiteral(resourceName: "icon-normal"), #imageLiteral(resourceName: "icon-good")]
        hasDownloaded = true
    }
}
