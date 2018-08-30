//
//  Bundle.swift
//  SlingBasicComponent
//
//  Created by Luan Kalume | Stone on 21/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

extension Bundle {
    
    public static var basic: Bundle {
        return Bundle(for: SlingView.self)
    }
    
}
