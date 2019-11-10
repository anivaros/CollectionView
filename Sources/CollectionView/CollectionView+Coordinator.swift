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
    
    class Coordinator<Cell>: NSObject, CollectionViewCoordinator where Cell: View {
        
        // MARK: - Properties
        
        var direction: UICollectionView.ScrollDirection
        var _collectionView: CollectionView!
        var cell: ((IndexPath) -> Cell)!
        var count: (() -> Int)!
        public var layout: UICollectionViewLayout {
            
            let flow = UICollectionViewFlowLayout()
            flow.scrollDirection = direction
            flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flow.itemSize = .init(width: 50, height: 50)
            flow.minimumInteritemSpacing = 0
            flow.minimumLineSpacing = 0
            
            return flow
        }
        
        
        // MARK: - Lifecycle
        
        required init(_ direction: UICollectionView.ScrollDirection) {
            self.direction = direction
            super.init()
        }
        
        // MARK: - Methods
        
        public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            count()
        }
        
        public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            let vc = UIHostingController(rootView: cell(indexPath))
            vc.view.frame = CGRect(origin: .zero, size: CGSize(width: _collectionView.props.width, height: _collectionView.props.height))
            vc.view.backgroundColor = .clear
            cel.addSubview(vc.view)
            cel.backgroundColor = .red
            
            return cel
        }
        
        public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            CGSize(width: _collectionView.props.width, height: _collectionView.props.height)
        }
    }
}
