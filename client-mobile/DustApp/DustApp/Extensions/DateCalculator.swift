//
//  DateCalculator.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/03.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let dustDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)!
        formatter.calendar = Calendar(identifier: .iso8601)
        return formatter
    }()
}

extension String {
    func calculate() -> (String, String) {
        guard let dustInfoDate = DateFormatter.dustDateFormatter.date(from: self) else { return ( "", "") }
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let components = calendar.dateComponents([.hour, .minute], from: dustInfoDate)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let time = "\(String(format: "%02d", hour)):\(String(format: "%02d", minute))"
        var dayOffset: String = ""
        if calendar.isDateInToday(dustInfoDate) { dayOffset = "오늘" }
        if calendar.isDateInYesterday(dustInfoDate) { dayOffset = "어제" }
        return (dayOffset, time)
    }
}
