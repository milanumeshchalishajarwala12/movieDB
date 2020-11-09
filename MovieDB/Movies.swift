//
//  File.swift
//  MovieDB
//
//  Created by Milan Chalishajarwala on 11/4/20.
//

import Foundation

class MovieModel: Decodable{
    var results: [Result]?
}


class Result: Decodable{
    var popularity: Double?
    var vote_count: Int?
    var video: Bool?
    var poster_path: String?
    var id: Int64?
    var adult: Bool?
    var backdrop_path: String?
    var original_language: String?
    var original_title: String?
    var genre_ids: [Int]?
    var title: String?
    var vote_average: Double?
    var overview: String?
    var release_date: String?
}
