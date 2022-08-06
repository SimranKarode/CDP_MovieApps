//
//  MovieViewModel.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/3/22.
//

import Foundation

struct MovieViewModel {
    private let _cdMovieDataRepository: MovieCoreDataRepo = MovieDataRepository()
    private let _movieApiRepository: MovieApiResorceRepo = MovieApiRepo()
    
    func getMovieRecord(completionHandler:@escaping(_ result: Array<Result>?)-> Void) {
        
        _cdMovieDataRepository.getMovieRecords{ response in
            if(response != nil && response?.count != 0) {
                completionHandler(response)
            } else{
                _movieApiRepository.getMovieRecords { apiResponse in
                    if(apiResponse != nil && apiResponse?.count != 0){
                      //insert record in core data
                        _ = _cdMovieDataRepository.insertMovieRecords(records: apiResponse!)
                        debugPrint("AnimalViewModel: Returning records to view controller")
                        completionHandler(apiResponse)
                    }
                }
            }
        }
    }
}
