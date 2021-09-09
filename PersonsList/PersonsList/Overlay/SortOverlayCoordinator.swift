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
    func handleSort(with model: [Person])
}


protocol SortedListProtocol: AnyObject  {
    func handleSortedList(list: [Person])
}

class SortOverlayCoordinator: SortOverlayCoordinatorProtocol {
    
    private let presenter: UIWindow
    private let personsList: [Person]
    weak var delegate: SortedListProtocol?
    
    init(presenter: UIWindow, list: [Person]) {
        self.presenter = presenter
        self.personsList = list
    }
    
    func start() {
        let viewModel = SortOverlayViewModel(with: self, list: personsList)
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
    
    func handleSort(with model: [Person]) {
        dismissOverlay()
        delegate?.handleSortedList(list: model)
    }
}
