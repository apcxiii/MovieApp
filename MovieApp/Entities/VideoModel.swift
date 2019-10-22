//
//  VideoModel.swift
//  MovieApp
//
//  Created by Erik on 22/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation
import ObjectMapper


class VideoResponse: Mappable {
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    id      <- map["id"]
    results <- map["results"]
  }
  
  var id: Int?
  var results: [VideoModel]?
}

class VideoModel: Mappable {
  required init?(map: Map) {
  }
  
  
  
  var id :String?
  var iso6391: String?
  var iso31661: String?
  var key: String?
  var name: String?
  var site: String?
  
  func mapping(map: Map) {
    id        <- map["id"]
    iso6391   <- map["iso_639_1"]
    iso31661  <- map["iso_3166_1"]
    key       <- map["key"]
    name      <- map["name"]
    site      <- map["site"]
  }
  
}
