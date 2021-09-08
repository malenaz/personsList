//
//  SortOverlayCoordinator.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/8/21.
//

import Foundation
import UIKit

protocol SortOverlayCoordinatorProtocol: AnyObject {
    func dismissOverlay()
    func handleSort()
}

class SortOverlayCoordinator: SortOverlayCoordinatorProtocol {
    
    private let presenter: UIWindow
    
    init(presenter: UIWindow) {
        self.presenter = presenter
    }
    
    func start() {
        let viewModel = SortOverlayViewModel(with: self)
        let sortOverlayView = SortOverlayView(frame: UIScreen.main.bounds)
        sortOverlayView.viewModel = viewModel
        presenter.addSubview(sortOverlayView)
        presenter.bringSubviewToFront(sortOverlayView)
    }
    
    func dismissOverlay() {
        for subview in presenter.subviews where subview is SortOverlayView {
            subview.removeFromSuperview()
        }
    }
    
    func handleSort() {
    }
}
