//
//  ViewController+Layout.swift
//  LayoutDemo
//
//  Created by Praks on 9/23/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit

extension ViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

            var group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [self.singleElement])
            let numberOfItems = self.collectionView.numberOfItems(inSection: 0)

            switch numberOfItems {
            case 2:
                group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)), subitem: self.singleElement, count: 2)
            case 3:
                group = self.threeElementsLayout()
            case 5:
                group = self.fiveElementsLayout()
            case 4, 6:
                group = self.fourAndSixElementsLayout(with: numberOfItems)
            default: break
            }
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
    
    var cellEdgeInset: NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    }

    var singleElement: NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(CGFloat(1))))
        item.contentInsets = self.cellEdgeInset
        return item
    }

    func halfHeightHorizontalLayoutGroup(with item: NSCollectionLayoutItem, count: Int) -> NSCollectionLayoutGroup {
        return NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)),
            subitem: item, count: count)
    }

    func verticalGroup(with items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)),
            subitems: items)
    }
    
    func threeElementsLayout() -> NSCollectionLayoutGroup {
        let twoItemsGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)),
            subitem: self.singleElement, count: 2)

        let singleItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)))

        let itemWidth = singleItem.layoutSize.widthDimension.dimension * self.collectionView.frame.width

        singleItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: itemWidth / 4, bottom: 8, trailing: itemWidth / 4)

        return self.verticalGroup(with: [twoItemsGroup, singleItem])
    }
    
    func fourAndSixElementsLayout(with numberOfItems: Int) -> NSCollectionLayoutGroup {
        let itemsGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)),
            subitem: self.singleElement, count: numberOfItems / 2)

        return NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)),
            subitem: itemsGroup, count: 2)
    }
    
    func fiveElementsLayout() -> NSCollectionLayoutGroup {
        let threeItemsGroup = self.halfHeightHorizontalLayoutGroup(with: self.singleElement, count: 3)

        let pairItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        let itemWidth = pairItem.layoutSize.widthDimension.dimension * self.collectionView.frame.width
        pairItem.contentInsets = self.cellEdgeInset

        let twoItemsGroup = self.halfHeightHorizontalLayoutGroup(with: pairItem, count: 2)
        twoItemsGroup.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: itemWidth / 3, bottom: 8, trailing: itemWidth / 3)

        return self.verticalGroup(with: [threeItemsGroup, twoItemsGroup])
    }
}
