//
//  ViewController.swift
//  LayoutDemo
//
//  Created by Praks on 9/23/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOfItems: Int = 1 {
        didSet {
            self.collectionView.reloadData()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!

    @IBAction func addAction(_ sender: Any) {
        guard numberOfItems < 6 else { return }
        numberOfItems += 1
    }
    
    @IBAction func removeAction(_ sender: Any) {
        guard numberOfItems > 1 else { return }
        numberOfItems -= 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.layer.cornerRadius = 10
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = createLayout()
        registerCell()
    }

    func registerCell() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
}
