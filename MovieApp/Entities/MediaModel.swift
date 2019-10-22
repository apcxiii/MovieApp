//
//  MediaModel.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation
import ObjectMapper


class MediaModel: NSObject, Mappable {
  
  var id: Int?
  var posterPath: String?
  var adult: Bool?
  var overview: String?
  var releaseDate: String?
  var originalTitle: String?
  var originalLanguage: String?
  var title: String?
  var backdropPath: String?
  var popularity: Float?
  var voteCount: Int?
  var video: Bool?
  var voteAverage: Float?
  
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
  }
  
  
  
}
