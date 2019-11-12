//
//  CollectionView+Setup.swift
//  Astrology
//
//  Created by Dima Virych on 10.11.2019.
//  Copyright © 2019 Virych. All rights reserved.
//

import CoreGraphics
import SwiftUI

public extension CollectionView {
    
    @discardableResult
    func itemSize(width: CGFloat = 50, height: CGFloat = 50, side: CGFloat? = nil) -> CollectionView {
        
        if let side = side {
            coordinator.width = side
            coordinator.height = side
        } else {
            coordinator.width = width
            coordinator.height = height
        }
        
        return self
    }
    
    @discardableResult
    func spacing(line: CGFloat = 10, cell: CGFloat = 10, space: CGFloat? = nil) -> CollectionView {
        
        if let space = space {
            coordinator.lineSpacing = space
            coordinator.cellSpacing = space
        } else {
            coordinator.lineSpacing = line
            coordinator.cellSpacing = cell
        }
        
        return self
    }
}

