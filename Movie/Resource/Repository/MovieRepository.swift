//
//  MovieRepository.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/3/22.
//

import Foundation

protocol MovieBaseRepository {
    func getMovieRecords(completionHandler:@escaping(_ result: Array<Result>?)->Void)
}

protocol MovieCoreDataRepo : MovieBaseRepository{
    func insertMovieRecords(records:Array<Result>) -> Bool
}

protocol MovieApiResorceRepo: MovieBaseRepository{
    
}
