//
//  CollectionView+Coordinator.swift
//  Astrology
//
//  Created by Dima Virych on 09.11.2019.
//  Copyright © 2019 Virych. All rights reserved.
//

import UIKit
import SwiftUI

public extension CollectionView {
    
    class CollectionViewCell<Cell>: UICollectionViewCell where Cell: View {
        
    }
    
    class Coordinator<Cell>: NSObject, CollectionViewCoordinator where Cell: View {
        
        // MARK: - Properties
        
        var width: CGFloat = 50
        var height: CGFloat = 50
        
        var lineSpacing: CGFloat = 10
        var cellSpacing: CGFloat = 10
        
        weak var customDelegate: UICollectionViewDelegateFlowLayout?
        
        var direction: UICollectionView.ScrollDirection
        var _collectionView: CollectionView!
        var cell: ((IndexPath) -> Cell)!
        
        let count: Int
        
        public var layout: UICollectionViewLayout {
            
            let flow = UICollectionViewFlowLayout()
            flow.scrollDirection = direction
            flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flow.itemSize = .init(width: width, height: height)
            flow.minimumInteritemSpacing = cellSpacing
            flow.minimumLineSpacing = lineSpacing
            
            return flow
        }
        
        
        // MARK: - Lifecycle
        
        required init(_ direction: UICollectionView.ScrollDirection, count: Int) {
            self.direction = direction
            self.count = count
            super.init()
        }
        
        public func setup(_ collectionView: UICollectionView) {
            
            collectionView.register(CollectionViewCell<Cell>.self, forCellWithReuseIdentifier: "cell")
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = .clear
        }
        
        
        // MARK: - Methods
        
        public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            count
        }
        
        public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            
            cel.addSubview(cell(indexPath))
            
            return cel
        }
        
        public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            CGSize(width: width, height: height)
        }
        
        public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            lineSpacing
        }
        
        public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            cellSpacing
        }
    }
}
