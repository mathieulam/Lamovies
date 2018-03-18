//
//  MovieListViewController.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieListProtocol {
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var movieSearchBar: UISearchBar!
    @IBOutlet weak var movieNoResultsLabel: UILabel!
    var moviesList: [Movie] = []
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
        
        presenter = MovieListPresenter(persoView: self)
        presenter.viewDidLoad()
        
        //remove ugly background from search bar view
        for subView in movieSearchBar.subviews {
            for view in subView.subviews {
                if view.isKind(of: NSClassFromString("UISearchBarBackground")!) {
                    let imageView = view as! UIImageView
                    imageView.removeFromSuperview()
                }
                if view.isKind(of: NSClassFromString("UITextField")!) {
                    view.backgroundColor = UIColor.white
                }
            }
        }
        
        self.presenter.searchMovies(movieTitle : movieTitle, movieYear: movieYear, movieType: movieType)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell
            else {
                fatalError("the dequeued cell is not an instance of MovieTableViewCell")
        }
        
        if !moviesList.isEmpty {
            let movie = moviesList[indexPath.row]
            cell.configureCell(movieObject: movie)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedID = self.moviesList[indexPath.row].imdbID!
        self.performSegue(withIdentifier: "segue_to_details", sender: self.moviesList[indexPath.row])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showMovieList(newMovies: [Movie]) {
        self.moviesList = newMovies
        if self.moviesList.isEmpty {
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
