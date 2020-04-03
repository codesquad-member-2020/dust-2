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
    }
    
    private(set) var grade: Grade
    private(set) var density: Int
    private(set) var time: String
    
    enum CodingKeys: String, CodingKey {
        case grade = "pm10Grade1h"
        case density = "pm10Value"
        case time = "dataTime"
    }
}

extension DustInfo.Grade {
    func color() -> CGColor {
        switch self {
            case .good: return UIColor(named: "good")!.cgColor
            case .normal: return UIColor(named: "normal")!.cgColor
            case .bad: return UIColor(named: "bad")!.cgColor
            case .worst: return UIColor(named: "worst")!.cgColor
        }
    }
    
    func gradeWord() -> String {
        switch self {
            case .good: return "좋음"
            case .normal: return "보통"
            case .bad: return "나쁨"
            case .worst: return "매우 나쁨"
        }
    }
    
    func gradeImage() -> UIImage? {
        switch self {
            case .good: return UIImage(named: "icon-good")
            case .normal: return UIImage(named: "icon-normal")
            case .bad: return UIImage(named: "icon-bad")
            case .worst: return UIImage(named: "icon-worst")
        }
    }
}
