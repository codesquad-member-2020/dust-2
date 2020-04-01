//
//  Station.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/31.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct Station: Codable {
    var name: String
    var dustInfos: [DustInfo]
    
    enum CodingKeys: String, CodingKey {
        case name = "location"
        case dustInfos = "dusts"
    }
}
