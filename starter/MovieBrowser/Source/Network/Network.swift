//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

protocol NetworkServiceProcotol {
    func fetchMovies(query: String, completion: @escaping ([Movie]) -> Void)
    func fetchImage(imageStr: String, completion: @escaping (UIImage?) -> Void)
}

class NetworkService: NetworkServiceProcotol {
    
    typealias MoviesCompletion = ([Movie]) -> Void
    typealias ImageCompletion = (UIImage?) -> Void
    
    let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    var movieStrBase: String {
        "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&language=en-US&page=1&include_adult=false&query="
    }
    let imageStrBase = "https://image.tmdb.org/t/p/w500/"
    
    func fetchMovies(query: String, completion: @escaping MoviesCompletion) {
        let movieStr = movieStrBase + query
        if let url = URL(string: movieStr) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let results = try decoder.decode(Results.self, from: data)
                        completion(results.results)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        } else {
            print("error")
        }
    }
    
    func fetchImage(imageStr: String, completion: @escaping ImageCompletion) {
        let finalImageStr = imageStrBase + imageStr
        if let image = ImageCache.shared.read(imageStr: finalImageStr) {
            completion(image)
        } else {
            if let imageURL = URL(string: finalImageStr) {
                URLSession.shared.dataTask(with: imageURL) { data, r, e in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        if let image = UIImage(data: data) {
                            ImageCache.shared.write(imageStr: finalImageStr, image: image)
                            completion(image)
                        }
                    }
                }.resume()
            }
        }
    }
    
}
