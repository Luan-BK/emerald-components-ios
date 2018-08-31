//
//  SlingPicker+Protocols.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 22/06/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import Foundation

public protocol PickerData {
    var identifier: String { get }
}

public protocol SlingPickerDelegate: class {
    /// Tells the delegate a options was selected.
    ///
    /// - parameters:
    ///   - picker: The SlingInput where the change happend.
    ///   - option: The selected option.
    func didSelectOption(_ picker: SlingPicker, option: PickerData)
    
    /// Tells the delegate a options was deselected.
    ///
    /// - parameters:
    ///   - picker: The SlingPicker where the change happend.
    ///   - option: The deselected option.
    func didDeselectOption(_ picker: SlingPicker, option: PickerData)
}

public protocol SlingPickerDataSource: class {
    
    /// Implement this method to return a list of objects conforming to PickerData protocol.
    ///
    /// If an asynchronous fetching is needed before returning the value, return an empty list
    /// and later when the fetching is done call startEditing method of SlingPicker.
    ///
    /// - parameters:
    ///   - picker: The picker where the data is needed.
    func pickerOptions(for picker: SlingPicker) -> [PickerData]
}

extension SlingPickerDelegate {
    public func didSelectOption(_ picker: SlingPicker, option: PickerData) {}
    public func didDeselectOption(_ picker: SlingPicker, option: PickerData) {}
}
