//
//  NetworkingManger.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol NetworkingManagerInputProtocol: class {  
  var remoteRequestHandler: NetworkingManagerOutputProtocol? { get set }
  
  // INTERACTOR -> NETWORKINGMANAGER
  func retrieveTopMovies()
  func retrievePopularMovies()
  func retrieveUpcomingMovies()
  
  func retrieveMovieVideos(id: Int)
  func retrieveTVShowsVideos(id: Int)
  
  // INTERACTOR -> NETWORKINGMANAGER
  func retrieveTopTVShows()
  func retrievePopularTVShows()
  
  func retrieveSearchMovies(query: String)
  func retrieveSearchTVShows(query: String)
}

protocol NetworkingManagerOutputProtocol: class {
  // NETWORKINGMANAGER -> INTERACTOR
  func onTopMoviesRetrieved(_ movies: [MediaModel])
  func onPopularMoviesRetrieved(_ movies: [MediaModel])
  func onUpcomingMoviesRetrieved(_ movies: [MediaModel])
  
  func onTopTVShowsRetrieved(_ tvShows: [MediaModel])
  func onPopularTVShowsRetrieved(_ tvShows: [MediaModel])
  
  func onTVShowVideosRetrieved(_ videos: [VideoModel])
  func onMovieVideosRetrieved(_ videos: [VideoModel])
  
  func onTVShowSearchRetrieved(_ tvShows: [MediaModel])
  func onMoviewSearchRetrieved(_ movies: [MediaModel])
  
  func onError()
}


class NetworkingManger: NetworkingManagerInputProtocol {
  var remoteRequestHandler: NetworkingManagerOutputProtocol?
  
  func retrievePopularMovies() {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.MoviesPopularList.fetch.url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<MediaResponse>) in
        switch response.result {
        case .success(_):
          if let mediaResponse = response.result.value {
            self.remoteRequestHandler?.onPopularMoviesRetrieved(mediaResponse.results ?? [])
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
  }
  
  func retrieveUpcomingMovies() {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.MoviesUpComingList.fetch.url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<MediaResponse>) in
        switch response.result {
        case .success(_):
          if let mediaResponse = response.result.value {
            self.remoteRequestHandler?.onUpcomingMoviesRetrieved(mediaResponse.results ?? [])
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
  }
    
  
  func retrieveTopMovies() {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.MoviesTopRatedList.fetch.url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<MediaResponse>) in
        switch response.result {
        case .success(_):
          if let mediaResponse = response.result.value {
            self.remoteRequestHandler?.onTopMoviesRetrieved(mediaResponse.results ?? [])
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
  }
  
  
  func retrieveTopTVShows() {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.TVShowsTopRatedList.fetch.url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<MediaResponse>) in
        switch response.result {
        case .success(_):
          if let mediaResponse = response.result.value {
            self.remoteRequestHandler?.onTopTVShowsRetrieved(mediaResponse.results ?? [])
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
  }
  
  func retrievePopularTVShows() {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.TVShowsPopularList.fetch.url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<MediaResponse>) in
        switch response.result {
        case .success(_):
          if let mediaResponse = response.result.value {            self.remoteRequestHandler?.onPopularTVShowsRetrieved(mediaResponse.results ?? [])
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
  }
  
  
  func retrieveMovieVideos(id: Int) {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.MovieVideoList.fetch(id).url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<VideoResponse>) in
        switch response.result {
        case .success(_):
          if let videoResponse = response.result.value {            self.remoteRequestHandler?.onMovieVideosRetrieved(videoResponse.results ?? [])
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
  }
  
  func retrieveTVShowsVideos(id: Int) {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.TVShowVideoList.fetch(id).url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<VideoResponse>) in
        switch response.result {
        case .success(_):
          if let videoResponse = response.result.value {            self.remoteRequestHandler?.onTVShowVideosRetrieved(videoResponse.results ?? [])
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
  }
  
  func retrieveSearchMovies(query: String) {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.MovieSearhList.fetch(query).url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<MediaResponse>) in
        switch response.result {
        case .success(_):
          if let videoResponse = response.result.value {
//            self.remoteRequestHandler?.onTVShowVideosRetrieved(videoResponse.results ?? [])
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
  }
  
  func retrieveSearchTVShows(query: String) {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.TVShowSearhList.fetch(query).url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<MediaResponse>) in
        switch response.result {
        case .success(_):
          if let videoResponse = response.result.value {
//            self.remoteRequestHandler?.onTVShowVideosRetrieved(videoResponse.results ?? [])
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
  }
  
  
  
}
