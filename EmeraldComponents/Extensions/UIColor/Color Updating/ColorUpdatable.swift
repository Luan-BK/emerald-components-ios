//
//  ColorUpdatable.swift
//  SlingComponent
//
//  Created by João Mendes | Stone on 29/01/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

public protocol ColorUpdatable {
    var colorTheme: CompanyTheme { get set }
    func updateColors(for colorTheme: CompanyTheme)
}
