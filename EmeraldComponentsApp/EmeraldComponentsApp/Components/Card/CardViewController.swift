//
//  CardViewController.swift
//  EmeraldComponentsApp
//
//  Created by João Mendes | Stone on 07/12/18.
//  Copyright © 2018 StoneCo. All rights reserved.
//

import UIKit
import EmeraldComponents

class CardViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var contentView: UICollectionView!
    
    private let reuseIdentifier: String = "Cell"
    public var customView: [UIView]! = [UIView()]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView.backgroundColor = UIColor.Palette.Light.white3
        self.view.backgroundColor = UIColor.Palette.Light.white3
        
        self.contentView.delegate = self
        self.contentView.dataSource = self
        
        self.instantiateCustomViews()
    }
    
    public func instantiateCustomViews() {
        let stoneCustomView = CustomStoneCollectionViewCell()
        let equalsCustomView = CustomEqualsCollectionViewCell()
        self.customView = [stoneCustomView.loadFromNib(),
                           equalsCustomView.loadFromNib()]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Collection delegate and datasource

extension CardViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8);
    }
    
}

extension CardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.customView.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier,
                                                      for: indexPath) as! CardView
        let view = customView[indexPath.row]
        
        cell.clipsToBounds = false
        cell.addSuperViewTo(customView: view,
                            width: cell.frame.size.width,
                            height: cell.frame.size.height)
        cell.setPropertyTo(view: view, cornerRadius: 10.0)
        cell.setPropertyTo(view: view, shadowRadius: 18.0)
        
        return cell
    }
    
}

extension CardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds: CGRect = UIScreen.main.bounds
        return CGSize(width: bounds.size.width - 32,
                      height: bounds.size.height / 2)
    }
    
}
