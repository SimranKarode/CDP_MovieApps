//
//  Movie+CoreDataProperties.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/3/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String
    @NSManaged public var releaseDate: String
    @NSManaged public var originalTitle: String
    @NSManaged public var overview: String
    @NSManaged public var posterPath: String
}

extension Movie : Identifiable {

}
