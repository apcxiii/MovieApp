//
//  SearchMediaInteractor.swift
//  MovieApp
//
//  Created by Erik on 22/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

protocol SearchMediaInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  func didRetrieveSearchMovies(_ movies: [MediaModel])
  func didRetrieveSearchTVShows(_ tvShows: [MediaModel])
  
  func onError()
}

protocol SearchMediaInteractorInputProtocol: class {
  var presenter: SearchMediaInteractorOutputProtocol? { get set }
  var networkManager: NetworkingManagerInputProtocol? { get set }
  var sourceMadiaType: Int {get set}
  
  // PRESENTER -> INTERACTOR
  func retrieveSearchMovies(query: String)
  func retrieveSearchTVShows(query: String)
}



class SearchMediaInteractor: SearchMediaInteractorInputProtocol, NetworkingManagerOutputProtocol {
  weak var presenter: SearchMediaInteractorOutputProtocol?
  var networkManager: NetworkingManagerInputProtocol?
  var sourceMadiaType: Int = 0
  
  
  func onTopMoviesRetrieved(_ movies: [MediaModel]) {
    //nothing to do
  }
  
  func onPopularMoviesRetrieved(_ movies: [MediaModel]) {
    //nothing to do
  }
  
  func onUpcomingMoviesRetrieved(_ movies: [MediaModel]) {
    //nothing to do
  }
  
  func onTopTVShowsRetrieved(_ tvShows: [MediaModel]) {
    //nothing to do
  }
  
  func onPopularTVShowsRetrieved(_ tvShows: [MediaModel]) {
    //nothing to do
  }
  
  func onTVShowVideosRetrieved(_ videos: [VideoModel]) {
    //nothing to do
  }
  
  func onMovieVideosRetrieved(_ videos: [VideoModel]) {
    //nothing to do
  }
  
  func onTVShowSearchRetrieved(_ tvShows: [MediaModel]) {
    presenter?.didRetrieveSearchTVShows(tvShows)
  }
  
  func onMoviewSearchRetrieved(_ movies: [MediaModel]) {
    presenter?.didRetrieveSearchMovies(movies)
  }
  
  
  
  func retrieveSearchMovies(query: String) {
    networkManager?.retrieveSearchMovies(query: query)
  }
  
  func retrieveSearchTVShows(query: String) {
    networkManager?.retrieveSearchTVShows(query: query)
  }
    
  
  func didRetrieveSearchMovies(_ movies: [MediaModel]) {
    presenter?.didRetrieveSearchMovies(movies)
  }
  
  func didRetrieveSearchTVShows(_ tvShows: [MediaModel]) {
    presenter?.didRetrieveSearchTVShows(tvShows)
  }
  
  func onError() {
    presenter?.onError()
  }
}
