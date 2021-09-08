//
//  PersonTableViewCell.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/6/21.
//

import Foundation
import UIKit

class PersonTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let workExpirience: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let containerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    var viewModel: Person? {
            didSet {
                guard let personItem = viewModel else {
                    return
                    
                }
                nameLabel.text = personItem.firstName + " " + personItem.lastName
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd.MM.YYYY"
                dateLabel.text = dateFormatter.string(from: personItem.dob)
                addressLabel.text = personItem.address!.streetAddress + " " + personItem.address!.city + " " + (personItem.address?.country)!
                workExpirience.text = "work expirience: \(personItem.workExpierence ?? 0)"
            }
        }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonSetup()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        commonSetup()
    }
        
    func commonSetup() {
        containerView.addSubview(nameLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(workExpirience)
        self.contentView.addSubview(containerView)
    
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true

        dateLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15).isActive = true

        addressLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15).isActive = true
    
        workExpirience.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor).isActive = true
        workExpirience.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15).isActive = true
    }
    
}
