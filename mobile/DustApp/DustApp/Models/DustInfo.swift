//
//  DustInfo.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/30.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

struct DustInfo: Codable {

    enum Grade: Int, Codable {
        case good = 1, normal, bad, worst
        case none
    }
    
    private(set) var grade: Grade
    private(set) var density: Int
    private(set) var time: Date
    private(set) var instrument: String
}
