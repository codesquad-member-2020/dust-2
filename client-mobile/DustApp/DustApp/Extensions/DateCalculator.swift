//
//  DateCalculator.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/03.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let dustDayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
}

extension String {
    func dateCalculator() -> (String, String) {
        let dateStrings = self.split(separator: " ")
        let dayString = String(dateStrings.first!)
        let timeString = String(dateStrings.last!)
        let dayDate = DateFormatter.dustDayFormatter.date(from: dayString)!
        let calendar = Calendar(identifier: .gregorian)
        let now = Date()
        let components = calendar.dateComponents([.hour], from: dayDate, to: now)
        let hours = components.hour!
        let dayOffset = hours >= 24 ? "어제" : "오늘"
        return (dayOffset, timeString)
    }
}
