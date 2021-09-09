//
//  SortOverlayView.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/8/21.
//

import Foundation
import UIKit

class SortOverlayView : UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var sortByName: UIButton!
    @IBOutlet weak var sortByLastName: UIButton!
    @IBOutlet weak var sortByDOB: UIButton!
    @IBOutlet weak var sortByUID: UIButton!
    
    var viewModel: SortOverlayViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    private func loadNib() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stackView.layer.cornerRadius = 10.0
        stackView.layer.shadowRadius = 5.0
        stackView.layer.shadowOpacity = 0.6
        stackView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
    }
    
    @IBAction func sortBy(_ sender: UIButton) {
        let  type: SortType
        switch sender {
            case sortByName:
                type = .firstName
                break
            case sortByLastName:
                type = .lastName
                break
            case sortByDOB:
                type = .dob
                break
            case sortByUID:
                type = .uid
                break
        default:
            type = .firstName
        }
        viewModel?.sortBy(type: type)
    }
    
}
