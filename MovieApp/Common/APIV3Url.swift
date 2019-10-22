//
//  APIUrl.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

struct API {
  static let baseUrl = "https://api.themoviedb.org/3/"
  static let apiKey = "f77f7079ae82d17cf1c414b0ea9532ea"
}

protocol APIUrl {
  var path: String { get }
  var url: String { get }
}

enum APIV3Url {
  enum MoviesPopularList: APIUrl {
    case fetch
    
    public var path: String {
      switch self {
      case .fetch:
        return "/movie/popular?api_key=\(API.apiKey)"
      }
    }
    
    public var url: String {
      switch self {
      case .fetch:
        return "\(API.baseUrl)\(path)"
      }
    }
  }
  
  enum MoviesTopRatedList: APIUrl {
    case fetch
    
    public var path: String {
      switch self {
      case .fetch:
        return "/movie/top_rated?api_key=\(API.apiKey)"
      }
    }
    
    public var url: String {
      switch self {
      case .fetch:
        return "\(API.baseUrl)\(path)"
      }
    }
  }
  
  
  enum MoviesUpComingList: APIUrl {
    case fetch
    
    public var path: String {
      switch self {
      case .fetch:
        return "/movie/upcoming?api_key=\(API.apiKey)"
      }
    }
    
    public var url: String {
      switch self {
      case .fetch:
        return "\(API.baseUrl)\(path)"
      }
    }
  }
}
