//
//  APICaller.swift
//  TrendingMovies(MVVM)
//
//  Created by Elmar Ibrahimli on 15.04.24.
//

import Foundation

final class APICaller {
    static func request<T: Codable> (endpoint: String,
                                     type: T.Type,
                                     urlSessionDelegate: URLSessionDelegate,
                                     completion: @escaping (Result<T, NetworkError>) -> Void)
    {
        guard let url = URL(string: NetworkConstants.shared.baseUrl + endpoint) else {
            completion(.failure(.urlError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(NetworkConstants.shared.apiKey)", forHTTPHeaderField: "Authorization")
        
        URLSession(configuration: .default,
                   delegate: urlSessionDelegate,
                   delegateQueue: .main)
        .dataTask(with: request)
        { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.parseError))
                return
            }
            do {
                
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            }
            catch {
                completion(.failure(.parseError))
                return
            }
        }.resume()
    }
}
