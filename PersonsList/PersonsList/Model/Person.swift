//
//  Person.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/6/21.
//

import Foundation

// MARK: - Person
struct Person: Codable {
    let firstName, lastName: String
    let dob: Date
    let uid: Int
    let workExpierence: Int?
    let address: Address?
}

// MARK: - Address
struct Address: Codable {
    let streetAddress, city: String
    let country: String?
}
