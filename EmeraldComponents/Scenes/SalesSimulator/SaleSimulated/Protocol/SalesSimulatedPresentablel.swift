//
//  SalesSimulatedPresentable.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 21/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

// MARK: - Button Presentable
public protocol ButtonSalesSimulatedPresentable {
    // Emerald Button UIKit styles
    var setStyle: EmeraldButtonStyle { get }
    var setType: EmeraldButtonType { get }
    
    // Button title controls
    var setTitle: String { get }
    var setState: UIControl.State { get }
}

extension ButtonSalesSimulatedPresentable {
    
    public var setStyle: EmeraldButtonStyle {
        return .outline
    }
    
    public var setType: EmeraldButtonType {
        return .regular
    }
    
    public var setTitle: String {
        return "Simular novamente"
    }
    
    public var setState: UIControl.State {
        return .normal
    }
    
}

// MARK: - Image Presentable
public protocol ImageSalesSimulatedPresentable {
    var iconImage: UIImage { get }
}

extension ImageSalesSimulatedPresentable {
    
    public var iconImage: UIImage {
        return UIImage(named: "icon-money", in: Bundle.basic, compatibleWith: nil)!
    }

}
