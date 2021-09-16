//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    static let identifier = String(describing: MovieDetailViewController.self)
    static let storyboardID = "MovieDetailStoryboard"
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDate: UILabel!
    @IBOutlet weak var detailOverview: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    var viewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        updateUI()
    }
    
    func updateUI() {
        detailTitle.text = viewModel?.movieTitle
        detailDate.text = viewModel?.movieReleaseDate
        detailOverview.text = viewModel?.movieOverview
        setImage()
    }
    
    func setImage() {
        let imageStr = viewModel?.moviePosterLink ?? ""
        viewModel?.fetchImage(imageStr: imageStr) { image in
            self.detailImage.image = image
        }
    }
    
}
