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
  func onError()
}

protocol MoviesInteractorInputProtocol: class {
  var presenter: MoviesInteractorOutputProtocol? { get set }
  var networkManager: NetworkingManagerInputProtocol? { get set }
  
  // PRESENTER -> INTERACTOR
  func retrieveTopMovies()
}

class MoviesInteractor: MoviesInteractorInputProtocol, NetworkingManagerOutputProtocol {
  
  
  
  weak var presenter: MoviesInteractorOutputProtocol?
  var networkManager: NetworkingManagerInputProtocol?
  
  func retrieveTopMovies() {
    networkManager?.retrieveTopMovies()
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
  
  func onError() {
    presenter?.onError()
  }
  
  
}
