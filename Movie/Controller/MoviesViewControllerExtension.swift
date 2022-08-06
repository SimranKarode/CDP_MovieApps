//
//  AnimalViewControllerExtension.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/6/22.
//

import Foundation
import UIKit

extension MoviesViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieViewCell", for: indexPath) as! MovieTableViewCell
        cell.onBind(data: movies![indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details : DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(details, animated: true)
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w500\(movies![indexPath.row].posterPath)")!)){
            (data, req, error) in
            
            guard
                let data = data
            else { return }
            
            DispatchQueue.main.async {
                details.Image.image = UIImage(data: data)
            }
                    
        }.resume()
        
        DispatchQueue.main.async {
            details.lbltitle.text = self.movies![indexPath.row].title
            details.date.text = self.movies![indexPath.row].releaseDate
            details.overview.text = self.movies![indexPath.row].overview
        }
        }
}
