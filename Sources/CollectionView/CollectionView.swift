//
//  CollectionView.swift
//  Astrology
//
//  Created by Dima Virych on 09.11.2019.
//  Copyright © 2019 Virych. All rights reserved.
//

import SwiftUI

public struct CollectionView<Element, Cell>: UIViewRepresentable where Cell: View {
    
    // MARK: - Properties
    
    /// Elements for showing on *CollectionView*
    public var elements: [Element]
    
    public var direction: UICollectionView.ScrollDirection
    
    /// Cell content for *CollectionView*
    public var cell: ((Element) -> Cell)
    
    
    // MARK: - Lifecycle
    
    /// Public *CollectionView* initializer
    ///
    /// - Parameters:
    ///    - items: List of items for *CollectionView*
    ///    - cell: Cell UI element conformed to *View* protocol
    ///    - direction: Direction of the *CollectionView*
    public init(_ items: [Element], cell: @escaping ((Element) -> Cell), direction: UICollectionView.ScrollDirection = .vertical) {
        
        self.elements = items
        self.cell = cell
        self.direction = direction
    }

    public func makeCoordinator() -> Coordinator<Cell> {
        
        Coordinator(direction, count: elements.count)
    }
    
    public func makeUIView(context: UIViewRepresentableContext<CollectionView>) -> UICollectionView {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: context.coordinator.layout)
        
        context.coordinator.cell = { index in
            return self.cell(self.elements[index.row])
        }
        
        context.coordinator.setup(collectionView)
        
        return collectionView
    }
    
    public func updateUIView(_ uiView: UICollectionView, context: UIViewRepresentableContext<CollectionView>) {
        
        uiView.reloadData()
    }
}
