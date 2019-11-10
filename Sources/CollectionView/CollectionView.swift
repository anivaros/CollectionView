//
//  CollectionView.swift
//  Astrology
//
//  Created by Dima Virych on 09.11.2019.
//  Copyright © 2019 Virych. All rights reserved.
//

import SwiftUI

public struct CollectionView<Element, Cell>: UIViewRepresentable where Element: Equatable, Cell: View {
    
    public var elements: [Element]
    public var cell: ((Element) -> Cell)
    
    // MARK: - Size
    
    public var props = Props()
    
    let coordinator: Coordinator<Cell>
    
    
    public init(_ items: [Element], cell: @escaping ((Element) -> Cell), direction: UICollectionView.ScrollDirection = .vertical) {
        self.elements = items
        self.cell = cell
        self.coordinator = Coordinator(direction)
        self.coordinator._collectionView = self
    }
    
    public func makeCoordinator() -> Coordinator<Cell> {
        return coordinator
    }
    
    public func makeUIView(context: UIViewRepresentableContext<CollectionView>) -> UICollectionView {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: context.coordinator.layout)
        
        
        context.coordinator.count = { self.elements.count }
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
