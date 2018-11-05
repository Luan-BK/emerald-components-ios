//
//  Calendar.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 24/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

extension Calendar {
    
    public static var emeraldCalendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "pt_BR")
        calendar.timeZone = TimeZone(identifier: "UTC")!
        return calendar
    }
    
    public static var today: Date {
        let components = Calendar.emeraldCalendar.dateComponents([.year,.month,.weekday,.day],
                                                               from: Date())
        return Calendar.emeraldCalendar.date(from: components) ?? Date()
    }
    
}
