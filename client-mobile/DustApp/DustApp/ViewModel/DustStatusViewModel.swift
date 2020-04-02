//
//  DustViewModel.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/03.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class DustStatusViewModel {
    
    var station: Station? {
        didSet {
            self.stationName = station!.name
            self.dustInfos = station?.dustInfos
        }
    }
    
    private(set) var stationName: String = ""
    
    private var dustInfos: [DustInfo]? = [] {
        didSet {
            dustDataRequestObserver?()
        }
    }
    
    var dustDataRequestObserver: (() -> Void)?
    var dustInfosCount: Int? { dustInfos?.count }
    
    func dustInfo(at index: Int) -> DustInfo? {
        return dustInfos?[index]
    }
}
