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
    
    private(set) var grade: Grade = .none
    private(set) var density: Int
    private(set) var time: Date = Date()
    private(set) var instrument: String = "-"
}

extension DustInfo.Grade {
    func color() -> CGColor {
        switch self {
            case .good: return UIColor(named: "good")!.cgColor
            case .normal: return UIColor(named: "normal")!.cgColor
            case .bad: return UIColor(named: "bad")!.cgColor
            case .worst: return UIColor(named: "worst")!.cgColor
            case .none: return UIColor.white.cgColor
        }
    }
}
