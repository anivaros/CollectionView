//
//  Created by Dima Virych on 30.11.2019.
//

import UIKit

#if canImport(SwiftUI)
import SwiftUI
#endif

fileprivate extension UIResponder {
    
    var parentViewController: UIViewController? {
        
        if let vc = self as? UIViewController {
            return vc
        }
        
        return next?.parentViewController
    }
}

extension UIView {
    
    func addSubview(_ controller: UIViewController) {
        
        guard let parent = parentViewController else {
            return
        }
        
        subviews.forEach { $0.removeFromSuperview() }
        
        parent.addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            controller.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            controller.view.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            controller.view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ])
        
        controller.didMove(toParent: parent)
    }
    
    #if canImport(SwiftUI)
    
    func addSubview<V: View>(_ view: V) {
        
        let vc = UIHostingController(rootView: view)
        vc.view.backgroundColor = .clear
        
        addSubview(vc)
    }
    #endif
}

