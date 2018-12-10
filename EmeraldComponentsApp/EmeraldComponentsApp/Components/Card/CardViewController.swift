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

    @IBOutlet weak var contentView: UICollectionView!
    
    let reuseIdentifier: String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView.backgroundColor = UIColor.Palette.Light.white3
        self.view.backgroundColor = UIColor.Palette.Light.white3
        
        self.contentView.delegate = self
        self.contentView.dataSource = self
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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier,
                                                      for: indexPath) as! CardView
        let custom = CustomCollectionViewCell()
        cell.addCustomSubview(view: custom.loadFromNib(),
                              width: cell.frame.size.width - 16,
                              height: cell.frame.size.height - 32)
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
