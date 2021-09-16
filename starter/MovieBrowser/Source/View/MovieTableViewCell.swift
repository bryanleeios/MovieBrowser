//
//  MovieTableViewCell.swift
//  MovieBrowser
//
//  Created by Bryan Lee on 9/16/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = String(describing: MovieTableViewCell.self)

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    var movieCellVM: MovieDetailViewModel?
    
    override func awakeFromNib() {
        accessoryType = .disclosureIndicator
    }
    
    func configure(movieCellVM: MovieDetailViewModel) {
        self.movieCellVM = movieCellVM
        updateUI()
    }
    
    func updateUI() {
        movieTitle.text = movieCellVM?.movieTitle
        movieDate.text = movieCellVM?.movieReleaseDate
        movieRating.text = movieCellVM?.movieRating
    }
}
