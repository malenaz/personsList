//
//  NetworkSession.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/7/21.
//

import Foundation

protocol NetworkSession {
    init(configuration: URLSessionConfiguration)
    func loadData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func loadData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: url, completionHandler: completionHandler).resume()
    }
}
