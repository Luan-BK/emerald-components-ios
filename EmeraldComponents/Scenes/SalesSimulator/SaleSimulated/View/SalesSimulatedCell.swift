//
//  SalesSimulatedCell.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 24/09/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class SalesSimulatedCell {
    
    public static func setupCell(header title: String, to tableView: UITableView) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 53))
        headerView.backgroundColor = UIColor.Palette.Light.white2
        
        let header = UILabel()
        header.textColor = UIColor.Palette.Dark.black3
        header.font = UIFont.boldSystemFont(ofSize: 14)
        header.text = title
        header.frame = CGRect(x: 24, y: headerView.center.y - 11, width: tableView.frame.size.width, height: 22)
        
        headerView.addSubview(header)
        return headerView
    }

}
