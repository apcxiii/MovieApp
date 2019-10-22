//
//  MediaModel.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation
import ObjectMapper


class MediaResponse: Mappable {
  var page: Int?
  var results: [MediaModel]?
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    page <- map["page"]
    results <- map["results"]
  }
  
  
  
}

class MediaModel: Mappable {
  
  var id: Int?
  var posterPath: String?
  var adult: Bool?
  var overview: String?
  
  var originalLanguage: String?
  
  var backdropPath: String?
  var popularity: Float?
  var voteCount: Int?
  var video: Bool?
  var voteAverage: Float?
  
  // MOVIE
  var releaseDate: String?
  var originalTitle: String?
  var title: String?
  
  //TV SHOW
  var firstAirDate: String?
  var originalName: String?
  var name: String?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    id         <- map ["id"]
    posterPath <- map["poster_path"]
    adult      <- map["adult"]
    overview <- map["overview"]
    releaseDate <- map["release_date"]
    originalTitle <- map["original_title"]
    originalLanguage <- map["original_language"]
    title <- map["title"]
    backdropPath <- map["backdrop_path"]
    popularity <- map["popularity"]
    voteCount <- map["vote_count"]
    voteAverage <- map["vote_average"]
    
    name <- map["name"]
    originalName <- map["original_name"]
    firstAirDate <- map["first_air_date"]
  }
  
  
  
}
