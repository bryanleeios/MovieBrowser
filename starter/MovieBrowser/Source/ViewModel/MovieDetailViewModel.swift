//
//  MovieCellViewModel.swift
//  MovieBrowser
//
//  Created by Bryan Lee on 9/16/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

struct MovieDetailViewModel {
    var movie: Movie
    var networkService = NetworkService()
    
    func fetchImage(imageStr: String, completion: @escaping (UIImage?) -> Void) {
        networkService.fetchImage(imageStr: imageStr, completion: completion)
    }

    var movieTitle: String {
        movie.title ?? "Unknown"
    }
    
    var releaseDate: String {
        movie.release_date ?? "Unknown"
    }

    var movieReleaseDate: String {
        if let date = dateFormatterInput.date(from: releaseDate) {
            return dateFormatterDisplay.string(from: date)
        } else {
            return "No Date"
        }
    }
    
    var movieRating: String {
        "\(movie.vote_average ?? 0)"
    }
    
    var movieOverview: String {
        movie.overview ?? "Unknown"
    }
    
    var moviePosterLink: String {
        movie.poster_path ?? "Unknown"
    }
    
}
