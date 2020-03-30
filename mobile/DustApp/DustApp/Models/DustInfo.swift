//
//  DustInfo.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/30.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

struct DustInfo {
    enum grade {
        case worst
        case bad
        case normal
        case good
    }
    
    var density: Int
    var time: Date
}
