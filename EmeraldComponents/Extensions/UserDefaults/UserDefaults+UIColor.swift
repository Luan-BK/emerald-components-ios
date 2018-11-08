//
//  UserDefaults+UIColor.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 06/11/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

extension UserDefaults {
    
    /// Unarcheives data and converts it to UIColor
    ///
    /// - Parameter key: Key to be unarchived
    /// - Returns: Returns the color stored
    func colorFor(key: String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: key) {
            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
        }
        return color
    }
    
    /// Archive UIColor to Data and save it as Any?
    ///
    /// - Parameters:
    ///   - color: Color to be archived
    ///   - key: Key to be stored
    func set(color: UIColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
        }
        set(colorData, forKey: key)
    }
    
}
