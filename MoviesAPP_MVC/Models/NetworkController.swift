//
//  DataSourceController.swift
//  MVC_MoviesApp
//
//  Created by Mariam Mchedlidze on 18.11.23.
//

import Foundation
import UIKit

class NetworkManagerController {
    let networkManager = NetworkManagerModel()
    
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void ) {
        let urlStr = "\(networkManager.baseURL)/movie/popular?api_key=\(networkManager.apiKey)"
        guard let url = URL(string: urlStr) else {
            completion(.failure(NSError(domain:"", code: -1, userInfo: [ NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain:"", code: -2, userInfo: [ NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let movieResponse = try JSONDecoder().decode(MoviesResponse.self, from: data)
                completion(.success(movieResponse.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(urlString)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
}

