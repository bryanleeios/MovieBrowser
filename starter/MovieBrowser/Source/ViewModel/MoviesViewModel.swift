//
//  MoviesViewModel.swift
//  MovieBrowser
//
//  Created by Bryan Lee on 9/16/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MoviesViewModel {
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    var networkService: NetworkServiceProcotol
    
    init(networkService: NetworkServiceProcotol = NetworkService()) {
        self.networkService = networkService
    }
    
    var updateUI : (() -> Void)?
    
    func bind(completion: @escaping () -> Void) {
        self.updateUI = completion
    }
    
    func fetchMovies(query: String) {
        networkService.fetchMovies(query: query) { movies in
            self.movies = movies
        }
    }
    
    func createDetailVM(row: Int) -> MovieDetailViewModel {
        MovieDetailViewModel(movie: movies[row])
    }
    
    func numberOfMovies() -> Int {
        movies.count
    }
    
}
