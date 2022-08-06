//
//  MovieDataRepository.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/3/22.
//

import Foundation

struct MovieDataRepository : MovieCoreDataRepo {
    
    
    
    func insertMovieRecords(records: Array<Result>) -> Bool {
        PersistentStorage.shared.persistentContainer.performBackgroundTask{ privateManagedContext in
            
            // Insert Code
            
            records.forEach{ movieRecord in
                let cdMovie = Movie(context: privateManagedContext)
                cdMovie.title = movieRecord.title
                cdMovie.releaseDate = movieRecord.releaseDate
                cdMovie.originalTitle = movieRecord.originalTitle
            }
            
            if(privateManagedContext.hasChanges){
                try? privateManagedContext.save()
            }
            
        }
        
        return true
    }
    
    func getMovieRecords(completionHandler: @escaping (Array<Result>?) -> Void) {

        PersistentStorage.shared.printDocumentDirectoryPath()

        let result = PersistentStorage.shared.fetchManagedObject(managedObject: Movie.self)
            var movies : Array<Result> = []
            result?.forEach({ (cdAnimal) in
                movies.append(cdAnimal.convertToMovie())
            })

            completionHandler(movies)

    }
}
