//
//  APIUrl.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

struct API {
  static let baseUrl = "https://api.themoviedb.org/3"
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
  
  
  enum TVShowsPopularList: APIUrl {
    case fetch
    
    public var path: String {
      switch self {
      case .fetch:
        return "/tv/popular?api_key=\(API.apiKey)"
      }
    }
    
    public var url: String {
      switch self {
      case .fetch:
        return "\(API.baseUrl)\(path)"
      }
    }
  }
  
  enum TVShowsTopRatedList: APIUrl {
    case fetch
    
    public var path: String {
      switch self {
      case .fetch:
        return "/tv/top_rated?api_key=\(API.apiKey)"
      }
    }
    
    public var url: String {
      switch self {
      case .fetch:
        return "\(API.baseUrl)\(path)"
      }
    }
  }
  
  enum TVShowVideoList: APIUrl {
    case fetch(_ id: Int)
    
    public var path: String {
      switch self {
      case .fetch(let id):
        return "/tv/\(id)/videos?api_key=\(API.apiKey)"
      }
    }
    
    public var url: String {
      switch self {
      case .fetch(_):
        return "\(API.baseUrl)\(path)"
      }
    }
  }
  
  enum MovieVideoList: APIUrl {
    case fetch(_ id: Int)
    
    public var path: String {
      switch self {
      case .fetch(let id):
        return "/movie/\(id)/videos?api_key=\(API.apiKey)"
      }
    }
    
    public var url: String {
      switch self {
      case .fetch(_):
        return "\(API.baseUrl)\(path)"
      }
    }
  }
  
  enum MovieSearhList: APIUrl {
    case fetch(_ query: String)
    public var path: String {
      switch self {
      case .fetch(let query):
        return "/search/movie?api_key=\(API.apiKey)&language=en-US&query=\(query)&page=1&include_adult=false"
      }
    }
    
    public var url: String {
      switch self {
      case .fetch(_):
        return "\(API.baseUrl)\(path)"
      }
    }
  }
  
  enum TVShowSearhList: APIUrl {
    case fetch(_ query: String)
    public var path: String {
      switch self {
      case .fetch(let query):
        return "/search/tv?api_key=\(API.apiKey)&language=en-US&query=\(query)&page=1&include_adult=false"
      }
    }
    
    public var url: String {
      switch self {
      case .fetch(_):
        return "\(API.baseUrl)\(path)"
      }
    }
  }
}
