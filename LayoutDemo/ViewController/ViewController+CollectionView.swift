//
//  ViewController+CollectionView.swift
//  LayoutDemo
//
//  Created by Praks on 9/23/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = #colorLiteral(red: 0.3725092411, green: 0.3725768626, blue: 0.3725003004, alpha: 1)
        cell.layer.cornerRadius = 10
        return cell
    }
}
