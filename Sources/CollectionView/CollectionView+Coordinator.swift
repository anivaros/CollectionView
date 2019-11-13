//
//  CollectionView+Coordinator.swift
//  Astrology
//
//  Created by Dima Virych on 09.11.2019.
//  Copyright © 2019 Virych. All rights reserved.
//

import UIKit
import SwiftUI

public class CollectionViewCell<Cell>: UICollectionViewCell where Cell: View {
    
    public func addHostView(_ vc: UIHostingController<Cell>) {
        
        subviews.forEach { $0.removeFromSuperview() }
        addSubview(vc.view)
    }
}

public extension CollectionView {
    
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
        var count: (() -> Int)!
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
        
        required init(_ direction: UICollectionView.ScrollDirection) {
            self.direction = direction
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
            count()
        }
        
        public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell<Cell>
            let vc = UIHostingController(rootView: cell(indexPath))
            vc.view.frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
            vc.view.backgroundColor = .clear
            
            cel.addHostView(vc)
            
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
