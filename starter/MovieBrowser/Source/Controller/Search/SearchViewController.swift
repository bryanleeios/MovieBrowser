//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func goButtonPressed(_ sender: Any) {
        viewModel.fetchMovies(query: searchTextNoSpace)
    }
    
    var searchTextNoSpace: String {
        searchBar.text?.replacingOccurrences(of: " ", with: "-") ?? ""
    }
    
    var viewModel: MoviesViewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Search"
        configureViewModel()
        configureTableView()
        searchBar.delegate = self
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func configureViewModel() {
        let setCompletion = { [weak self] in
            guard let wself = self else { return }
            wself.reloadData()
        }
        viewModel.bind(completion: setCompletion)
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: MovieTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else {
            fatalError()
        }
        
        cell.configure(movieCellVM: viewModel.createDetailVM(row: indexPath.row))
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondStoryBoard = UIStoryboard(name: MovieDetailViewController.storyboardID, bundle: nil)
        guard let detailsVC = secondStoryBoard.instantiateViewController(identifier: MovieDetailViewController.identifier) as? MovieDetailViewController else {
            return
        }
        
        detailsVC.viewModel = viewModel.createDetailVM(row: indexPath.row)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
    }
    
}
