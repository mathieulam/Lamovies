//
//  MovieListViewController.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CanUpdateViewDelegate {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var movieNoResultsLabel: UILabel!

    var presenter: MovieListPresenter!
    var movieTitle = ""
    var movieYear = ""
    var movieType = ""
    var selectedID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieNoResultsLabel.isHidden = true
        movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        presenter = MovieListPresenter(canUpdateViewDelegate: self)
        presenter.searchMovies(movieTitle : movieTitle, movieYear: movieYear, movieType: movieType)
    }
}

private extension MovieListViewController {
    
    func updateView()  {
        if presenter.getMovieList().isEmpty {
            movieNoResultsLabel.isHidden = false
            movieTableView.isHidden = true
        } else {
            movieNoResultsLabel.isHidden = true
            movieTableView.isHidden = false
            movieTableView.reloadData()
        }
    }
}

extension MovieListViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getMovieListCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell
        else {
            fatalError("the dequeued cell is not an instance of MovieTableViewCell")
        }
        
        if !presenter.getMovieList().isEmpty {
            let movie = presenter.getMovieList()[indexPath.row]
            cell.configureCell(movieObject: movie)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedID = presenter.getMovieList()[indexPath.row].imdbID!
        performSegue(withIdentifier: "segue_to_details", sender: presenter.getMovieList()[indexPath.row])
    }
}

extension MovieListViewController {

    func updateData() {
        movieTableView.reloadData()
        updateView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_to_details" {
            if let destinationVC = segue.destination as? MovieDetailsViewController {
                destinationVC.imdbId = selectedID
            }
        }
    }
}

extension MovieListViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter.searchMovies(movieTitle : searchBar.text, movieYear: "", movieType: "")
    }
}
