//
//  APIHandler.swift
//  MovieDB
//
//  Created by Milan Chalishajarwala on 11/4/20.
//

import Foundation


class APIHandler{
    typealias completionHandler = ((Any?, URLResponse?, Error?) -> ())
    var closureForNowShowing: completionHandler? = nil
    var closureForPopular: completionHandler? = nil
    
    
    func fetchData<T:Decodable>(type: T.Type, contentType: String){
        let endpoint = "https://api.themoviedb.org/3/movie/\(contentType)?language=en-US&page=undefined&api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
        
        let url = URL(string: endpoint)
        guard let unwrappedUrl = url else { return }
        URLSession.shared.dataTask(with: unwrappedUrl){
            (data, response, error) in
            do{
                guard let data = data else { return }
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                switch(contentType){
                case "now_playing":
                    let modelData = jsonData as! MovieModel
                    if let closureBlock = self.closureForNowShowing {
                        closureBlock(modelData, response, error)
                    }
                    break
                case "popular":
                    let modelData = jsonData as! MovieModel
                    if let closureBlock = self.closureForPopular {
                        closureBlock(modelData, response, error)
                    }
                    break
                default:
                    return
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }

func fetchDataForThePurposeOfMergingBranches<T:Decodable>(type: T.Type, contentType: String){
        let endpoint = "https://api.themoviedb.org/3/movie/\(contentType)?language=en-US&page=undefined&api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
        
        let url = URL(string: endpoint)
        guard let unwrappedUrl = url else { return }
        URLSession.shared.dataTask(with: unwrappedUrl){
            (data, response, error) in
            do{
                guard let data = data else { return }
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                switch(contentType){
                case "now_playing":
                    let modelData = jsonData as! MovieModel
                    if let closureBlock = self.closureForNowShowing {
                        closureBlock(modelData, response, error)
                    }
                    break
                case "popular":
                    let modelData = jsonData as! MovieModel
                    if let closureBlock = self.closureForPopular {
                        closureBlock(modelData, response, error)
                    }
                    break
                default:
                    return
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
