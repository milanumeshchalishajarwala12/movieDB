//
//  APIHandler.swift
//  MovieDB
//
//  Created by Milan Chalishajarwala on 11/4/20.
//

import Foundation


class APIHandler{
    typealias completionHandler = ((MovieModel?, URLResponse?, Error?) -> ())
    var closure: completionHandler? = nil

    func fetchData<T:Decodable>(type: T.Type, contentType: String){
        let endpoint = "https://api.themoviedb.org/3/movie/\(contentType)?language=en-US&page=undefined&api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
        
        let url = URL(string: endpoint)
        guard let unwrappedUrl = url else { return }
        URLSession.shared.dataTask(with: unwrappedUrl){
            (data, response, error) in
            do{
                guard let data = data else { return }
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                let modelData = jsonData as! MovieModel
                if let closureBlock = self.closure {
                    closureBlock(modelData, response, error)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
