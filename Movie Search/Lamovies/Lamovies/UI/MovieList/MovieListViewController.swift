//
//  MovieListViewController.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieListProtocol {
    
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
        
        presenter = MovieListPresenter(movieListView: self)
        
        self.presenter.searchMovies(movieTitle : movieTitle, movieYear: movieYear, movieType: movieType)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getMovieListCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell
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
        self.performSegue(withIdentifier: "segue_to_details", sender: presenter.getMovieList()[indexPath.row])
    }
    
    //MARK: - Movie List Presenter protocol
    func reloadData() {
        movieTableView.reloadData()
        updateView()
    }
    
    func updateView()  {
        if presenter.getMovieList().isEmpty{
            movieNoResultsLabel.isHidden = false
            movieTableView.isHidden = true
        } else {
            movieNoResultsLabel.isHidden = true
            movieTableView.isHidden = false
            self.movieTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_to_details" {
            let destinationVC = segue.destination as! MovieDetailsViewController
            destinationVC.imdbId = selectedID
            
        }
        
    }
    

}

extension MovieListViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.presenter.searchMovies(movieTitle : searchBar.text, movieYear: "", movieType: "")
    }
    
}
