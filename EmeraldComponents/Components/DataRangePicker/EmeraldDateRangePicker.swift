//
//  EmeraldDateRangePicker.swift
//  EmeraldComponents
//
//  Created by Luan Kalume | Stone on 13/08/2018.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public protocol EmeraldDateRangePickerDelegate: class {
    func didChooseDateRange(start: Date?, end: Date?, range: EmeraldDateRangePicker.EmeraldDatePeriod)
}
//EUIDateRangePicker
public class EmeraldDateRangePicker: UITableViewController {
    
    private let themeManager = ThemeManager()
    
    public enum EmeraldDatePeriod: Int {
        case today
        case yesterday
        case last7Days
        case last30Days
        case thisMonth
        case lastMonth
        case custom
        
        public var description: String {
            switch self {
            case .today:
                return NSLocalizedString("DATE_PERIOD_TODAY", bundle: Bundle.basic, comment: "")
            case .yesterday:
                return NSLocalizedString("DATE_PERIOD_YESTERDAY", bundle: Bundle.basic, comment: "")
            case .last7Days:
                return NSLocalizedString("DATE_PERIOD_LAST_7_DAYS", bundle: Bundle.basic, comment: "")
            case .last30Days:
                return NSLocalizedString("DATE_PERIOD_LAST_30_DAYS", bundle: Bundle.basic, comment: "")
            case .thisMonth:
                return NSLocalizedString("DATE_PERIOD_THIS_MONTH", bundle: Bundle.basic, comment: "")
            case .lastMonth:
                return NSLocalizedString("DATE_PERIOD_LAST_MONTH", bundle: Bundle.basic, comment: "")
            case .custom:
                return NSLocalizedString("DATE_PERIOD_CUSTOM", bundle: Bundle.basic, comment: "")
            }
        }
    }
    
    private let cellIdentifier = "EmeraldDateRangePickerCell"
    
    internal var ranges: [EmeraldDatePeriod] = [.today,
                                                .yesterday,
                                                .last7Days,
                                                .last30Days,
                                                .thisMonth,
                                                .lastMonth,
                                                .custom]
    
    public var calendar: Calendar = Calendar.current
    public var selectedPeriod: EmeraldDatePeriod = .today
    
    public weak var delegate: EmeraldDateRangePickerDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        self.tableView.rowHeight = 53.0
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
        self.navigationItem.backBarButtonItem?.title = ""
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let custom as EmeraldCustomDateRangePicker:
            custom.delegate = self.delegate
        default:
            break
        }
    }
    
    // MARK: - Dates
    
    internal func dateRange(for period: EmeraldDateRangePicker.EmeraldDatePeriod) -> (start: Date?, end: Date?) {
        let today = Date()
        
        switch period {
        case .today:
            return (today, today)
        case .yesterday:
            return (today.addingDays(-1), today.addingDays(-1))
        case .last7Days:
            return (today.addingDays(-6), today.addingDays(0))
        case .last30Days:
            return (today.addingDays(-29), today.addingDays(0))
        case .thisMonth:
            return (today.monthStart(), today.monthEnd())
        case .lastMonth:
            return (today.addingMonths(-1)?.monthStart(), today.addingMonths(-1)?.monthEnd())
        case .custom:
            return (today, today)
        }
    }

    // MARK: - UITableViewDelegate / UITableViewDatasource
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ranges.count
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) else {
            return UITableViewCell()
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.ranges[indexPath.row].description
        
        if self.ranges[indexPath.row] == self.selectedPeriod {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
            cell.textLabel?.textColor = themeManager.getTheme()
        } else {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
            cell.textLabel?.textColor = UIColor.Palette.Dark.black3
        }
        
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPeriod = self.ranges[indexPath.row]
        
        guard self.selectedPeriod == .custom else {
            let dateRange = self.dateRange(for: self.selectedPeriod)
            
            self.delegate?.didChooseDateRange(start: dateRange.start, end: dateRange.end, range: self.selectedPeriod)
            return
        }
        
        self.performSegue(withIdentifier: "CustomDateRangeSegue", sender: nil)
    }
    
}
