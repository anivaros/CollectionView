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
    
    class Props {

        var width: CGFloat = 50
        var height: CGFloat = 50
    }
    
    @discardableResult
    func itemSize(width: CGFloat = 50, height: CGFloat = 50, side: CGFloat? = nil) -> CollectionView {
        
        if let side = side {
            props.width = side
            props.height = side
        } else {
            props.width = width
            props.height = height
        }
        
        return self
    }
}

