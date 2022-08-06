//
//  Networker.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/3/22.
//

import Foundation

//class NetworkingService {
//    private init(){}
//    static let shared = NetworkingService()
//    func request(_ urlPath: String, completion: @escaping (Result<Data, NSError>) -> Void){
//        let url = URL(string: urlPath)!
//        
//        let session = URLSession.shared
//        let task = session.dataTask(with: url){ (data, _, error) in
//            
//            if let unWrappedError = error {
//                completion(.failure(unWrappedError as NSError))
//            }else if let unWrappedData = data {
//                completion(.success(unWrappedData))
//            }
//        }
//        task.resume()
//    }
//}
