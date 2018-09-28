//
//  Date.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 13/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

extension Date {
    
    func dateStringWithSlashes() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter.string(from: self)
    }
    
    func addingDays(_ days: Int) -> Date {
        
        let oneDayInterval = TimeInterval(60 * 60 * 24)
        
        return self.addingTimeInterval(Double(days) * oneDayInterval)
    }
    
    func addingMonths(_ months: Int, _ calendar: Calendar = Calendar.current) -> Date? {
        
        return calendar.date(byAdding: .month, value: months, to: self)
    }
    
    func monthStart(_ calendar: Calendar = Calendar.current) -> Date? {
        let components: DateComponents = calendar.dateComponents([.year, .month, .hour],
                                                                 from: Calendar.current.startOfDay(for: self))
        return Calendar.current.date(from: components)
    }
    
    func monthEnd(_ calendar: Calendar = Calendar.current) -> Date? {
        var components: DateComponents = calendar.dateComponents([.month, .day, .hour],
                                                                 from: Calendar.current.startOfDay(for: self))
        components.month = 1
        components.day = -1
        
        guard let monthStart = self.monthStart() else { return nil }
        
        return Calendar.current.date(byAdding: components, to: monthStart)
    }
    
    // MARK: - Date to String methods
    
    func monthString(_ short: Bool = false, _ calendar: Calendar = Calendar.emeraldCalendar) -> String {
        let componentValue = calendar.component(.month, from: self)
        
        if short {
            return calendar.shortMonthSymbols[componentValue - 1].capitalized
        } else {
            return calendar.monthSymbols[componentValue - 1].capitalized
        }
    }
    
    func simpleDateString(_ calendar: Calendar = Calendar.emeraldCalendar) -> String? {
        let formartter = DateFormatter()
        formartter.calendar = calendar
        formartter.dateFormat = "dd/MM/yy"
        
        return formartter.string(from: self)
    }

}
