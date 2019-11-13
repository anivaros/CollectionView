//
//  CollectionViewCoordinator.swift
//  Astrology
//
//  Created by Dima Virych on 09.11.2019.
//  Copyright © 2019 Virych. All rights reserved.
//

import UIKit

public protocol CollectionViewCoordinator: class, UICollectionViewDataSource & UICollectionViewDelegateFlowLayout {

    var layout: UICollectionViewLayout { get }
    
    func setup(_ collectionView: UICollectionView)
}
