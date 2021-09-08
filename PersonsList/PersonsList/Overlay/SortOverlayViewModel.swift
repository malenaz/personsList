//
//  SortOverlayViewModel.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/8/21.
//

import Foundation

protocol SortOverlayViewModelProtocol: AnyObject {
    func dismiss()
    func sort()
}

class SortOverlayViewModel: SortOverlayViewModelProtocol {
    private var coordinator: SortOverlayCoordinatorProtocol
    
    init(with coordinator: SortOverlayCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func dismiss() {
        coordinator.dismissOverlay()
    }
    
    func sort() {
        coordinator.dismissOverlay()
    }
    
    
}
