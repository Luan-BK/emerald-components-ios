//
//  Bundle.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 21/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

extension Bundle {
    
    @available(*, deprecated, message: "Prefer uses Bundle.emerald instead")
    public static var basic: Bundle {
        return Bundle(for: EmeraldView.self)
    }
    
    public static var emerald: Bundle {
        return Bundle(for: EmeraldView.self)
    }
    
}
