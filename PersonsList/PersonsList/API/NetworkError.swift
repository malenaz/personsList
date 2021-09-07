//
//  NetworkError.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/7/21.
//

import Foundation

enum NetworkError: Error, Equatable {
    case noNetwork
    case notAuthenticated
    case noData
    case invalidData
    case invalidUrl
    case networkError(NSError)
    case decodingError(NSError)
    
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case let (.networkError(lhsError), .networkError(rhsError)):
            return lhsError == rhsError
        case let (.decodingError(lhsError), .decodingError(rhsError)):
            return lhsError == rhsError
        case (.noNetwork, .noNetwork),
             (.notAuthenticated, .notAuthenticated),
             (.noData, .noData),
             (.invalidData, .invalidData),
             (.invalidUrl, .invalidUrl):
            return true
        default:
            return false
        }
    }
}
