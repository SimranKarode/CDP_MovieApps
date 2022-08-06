//
//  MovieApiRepo.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/3/22.
//

import Foundation

struct MovieApiRepo: MovieApiResorceRepo{
    func getMovieRecords(completionHandler: @escaping (Array<Result>?) -> Void) {

        URLSession.shared.dataTask(with: ApiResource.movieResource) { (data, response, error) in
            if(error == nil && data != nil) {
                do {
                    // deocding the response
                    let result = try JSONDecoder().decode(Movies.self, from: data!)
                    if(result.page == 1) {
                        completionHandler(result.results) // sending decoded response back
                    }else{
                        debugPrint("error in response, please contact codecat15")
                    }

                } catch let error {
                    debugPrint(error)
                }
            }

        }.resume()
    }
}
