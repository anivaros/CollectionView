//
//  File.swift
//  
//
//  Created by Dima Virych on 12.11.2019.
//

import UIKit

public extension CollectionView {
    
    @discardableResult
    func layoutDelegate(_ custom: UICollectionViewDelegateFlowLayout) -> CollectionView {
        
        props.collectionView.delegate = custom
        
        return self
    }
}
