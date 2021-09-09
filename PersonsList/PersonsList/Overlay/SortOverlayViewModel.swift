//
//  SortOverlayViewModel.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/8/21.
//

import Foundation

enum SortType: String {
    case firstName
    case lastName
    case dob
    case uid
}

protocol SortOverlayViewModelProtocol: AnyObject {
    func dismiss()
    func sortBy(type: SortType)
}

class SortOverlayViewModel: SortOverlayViewModelProtocol {
    private var coordinator: SortOverlayCoordinatorProtocol
    private var personsList: [Person]
    
    init(with coordinator: SortOverlayCoordinatorProtocol, list: [Person]) {
        self.coordinator = coordinator
        self.personsList = list
    }
    
    func dismiss() {
        coordinator.dismissOverlay()
    }
    
    func sortBy(type: SortType) {
        switch type {
        case .firstName:
            personsList = personsList.sorted{ $0.firstName < $1.firstName }
            break
        case .lastName:
            personsList =  personsList.sorted{ $0.lastName < $1.lastName }
            break
        case .dob:
            personsList = personsList.sorted{ $0.dob < $1.dob }
            break
        case .uid:
            personsList = personsList.sorted{ $0.uid < $1.uid }
            break
        }
        coordinator.handleSort(with: personsList)
    }
    
    
}
