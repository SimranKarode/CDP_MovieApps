//
//  MoviesViewController.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/6/22.
//

import UIKit

class MoviesViewController: UIViewController {
    var movies : Array<Result>? = nil
    private let movieViewModel = MovieViewModel()
    @IBOutlet weak var tblMovie: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMovie.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieViewCell")
        // Do any additional setup after loading the view.
        

        movieViewModel.getMovieRecord {[weak self] movieRecords in
            guard let self = self else { return }
            DispatchQueue.main.async {
                
                if(movieRecords != nil && movieRecords?.count != 0){
                    self.movies = movieRecords
                    self.tblMovie.reloadData()
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
