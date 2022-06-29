//
//  Network.swift
//  ContactsApp
//
//  Created by Luann Luna on 09/06/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class ContactService {
    private let baseURL = "https://jserver-api.herokuapp.com/users"
    
    func getContacts(completionHandler: @escaping (Result<[Contact], NetworkError>) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
                return completionHandler(.failure(.badUrl))
            }
            
            guard let data = data else {
                return completionHandler(.failure(.noData))
            }

            guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else {
                return completionHandler(.failure(.decodingError))
            }
            
            completionHandler(.success(contacts))
        }.resume()
    }
    
}
