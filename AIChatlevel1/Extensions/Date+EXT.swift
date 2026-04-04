//
//  Date+EXT.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 04/04/26.
//

import Foundation

extension Date {
    func addingTimeInterval(
        days: Int = 0,
        hours: Int = 0,
        minutes: Int = 0
    ) -> Date {
        var components = DateComponents()
        components.day = days
        components.hour = hours
        components.minute = minutes

        return Calendar.current.date(byAdding: components, to: self) ?? self
    }
}
