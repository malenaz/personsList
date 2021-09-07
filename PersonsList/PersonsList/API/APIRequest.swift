//
//  APIRequest.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/7/21.
//

import Foundation
protocol APIRequestProtocol {
    func getData<T: Decodable>(from path: String, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class APIRequest: APIRequestProtocol {
    let networkSession: NetworkSession
    
    init(networkSession: NetworkSession) {
        self.networkSession = networkSession
    }
    
    func getData<T: Decodable>(from path: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let fullUrl = URL(string: path) else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }
        networkSession.loadData(with: fullUrl) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(.networkError(error as NSError)))
                } else {
                    completion(.failure(.noNetwork))
                }
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .millisecondsSince1970
                let decodedObject = try decoder.decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(NetworkError.decodingError(error as NSError)))
            }
        }
    }
}
