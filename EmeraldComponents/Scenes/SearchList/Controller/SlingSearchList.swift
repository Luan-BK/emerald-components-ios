//
//  SlingSearchList.swift
//  EmeraldComponents
//
//  Created by João Mendes | Stone on 13/06/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit

public class SlingSearchList: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    internal var filteredData: [PickerData]? {
        didSet {
            self.tableView.reloadSections([0], with: .automatic)
        }
    }
    
    public weak var delegate: SearchListDelegate?
    public var selectedOption: PickerData?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        searchBar.returnKeyType = .done
        searchBar.placeholder = NSLocalizedString("SEARCH_BAR_PLACEHOLDER", bundle: Bundle.basic, comment: "")
        searchBar.autocorrectionType = .no
        // Removes searchBar borders
        searchBar.backgroundImage = UIImage()
        
        self.filteredData = self.delegate?.dataList ?? []
    }
    
    @IBAction func cancelButtonTouched() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SlingSearchList: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData?[indexPath.row].identifier
        
        if filteredData?[indexPath.row].identifier == self.selectedOption?.identifier {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchBar.resignFirstResponder()
        
        if let selection = self.filteredData?[indexPath.row] {
            if selection.identifier == self.selectedOption?.identifier {
                self.delegate?.didDeselectOption(selection)
            } else {
                self.delegate?.didSelectOption(selection)
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SlingSearchList: UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            self.filteredData = self.delegate?.dataList
            self.searchBar.resignFirstResponder()
        } else {
            self.filteredData = self.delegate?.dataList.filter {
                $0.identifier.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: nil).contains(searchText.lowercased())
            }
        }
    }
    
}
