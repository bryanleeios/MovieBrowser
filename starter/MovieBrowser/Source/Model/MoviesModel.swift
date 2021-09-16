//
//  MoviesModel.swift
//  MovieBrowser
//
//  Created by Bryan Lee on 9/16/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct Results: Codable {
    var results: [Movie]
}

struct Movie: Codable {
    let title: String?
    let release_date: String?
    let vote_average: Double?
    let overview: String?
    let poster_path: String?
}
