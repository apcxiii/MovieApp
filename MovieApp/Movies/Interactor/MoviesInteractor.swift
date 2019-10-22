//
//  MoviesInteractor.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation


protocol MoviesInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  func didRetrieveTopMovies(_ movies: [MediaModel])
  func didRetrieveUpcomingMovies(_ movies: [MediaModel])
  func didRetrievePopularMovies(_ movies: [MediaModel])
  
  
  func didRetrieveTopTvShows(_ tvShows: [MediaModel])
  func didRetrievePopularShows(_ tvShows: [MediaModel])
   
  func onError()
}

protocol MoviesInteractorInputProtocol: class {
  var presenter: MoviesInteractorOutputProtocol? { get set }
  var networkManager: NetworkingManagerInputProtocol? { get set }
  var sourceMadiaType: Int {get set}
  // PRESENTER -> INTERACTOR
  func retrieveTopMovies()
  func retrievePopularMovies()
  func retriveUpcomingMovies()
  func retrieveTopTVShows()
  func retrievePopularTVShows()
}

class MoviesInteractor: MoviesInteractorInputProtocol, NetworkingManagerOutputProtocol {
      
  weak var presenter: MoviesInteractorOutputProtocol?
  var networkManager: NetworkingManagerInputProtocol?
  var sourceMadiaType: Int = 0
  
  func retrieveTopMovies() {
    networkManager?.retrieveTopMovies()
  }
  
  func retrievePopularMovies() {
    networkManager?.retrievePopularMovies()
  }
  
  func retriveUpcomingMovies() {
    networkManager?.retrieveUpcomingMovies()
  }
  
  func retrieveTopTVShows() {
    networkManager?.retrieveTopTVShows()
  }
  
  func retrievePopularTVShows() {
    networkManager?.retrievePopularTVShows()
  }
  
  func onPopularMoviesRetrieved(_ movies: [MediaModel]) {
    presenter?.didRetrievePopularMovies(movies)
  }
  
  func onUpcomingMoviesRetrieved(_ movies: [MediaModel]) {
    presenter?.didRetrieveUpcomingMovies(movies)
  }
  
  
  func onTopMoviesRetrieved(_ movies: [MediaModel]) {
    presenter?.didRetrieveTopMovies(movies)
  }
  
  
  func onTopTVShowsRetrieved(_ tvShows: [MediaModel]) {
    presenter?.didRetrieveTopTvShows(tvShows)
  }
  
  func onPopularTVShowsRetrieved(_ tvShows: [MediaModel]) {
    presenter?.didRetrievePopularShows(tvShows)
  }
  
  
  func onTVShowVideosRetrieved(_ videos: [VideoModel]) {
    
  }
  
  func onMovieVideosRetrieved(_ videos: [VideoModel]) {
    
  }
  
  func onError() {
    presenter?.onError()
  }
  
  
}
