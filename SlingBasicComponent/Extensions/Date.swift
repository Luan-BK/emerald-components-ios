//
//  Date.swift
//  SlingBasicComponent
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
    
}
