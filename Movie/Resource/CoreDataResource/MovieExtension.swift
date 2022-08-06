//
//  MovieExtension.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/4/22.
//

import Foundation

extension Movie {
    func convertToMovie() -> Result {
        return Result(originalTitle: self.originalTitle, overview: self.overview, posterPath: self.posterPath, releaseDate: self.releaseDate, title: self.title)
    }
}
