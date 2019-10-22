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
    func onError()
}

protocol CarsInteractorInputProtocol: class {
  var presenter: MoviesInteractorOutputProtocol? { get set }
  var networkManager: NetworkingManagerInputProtocol? { get set }
  
  // PRESENTER -> INTERACTOR
  func retrieveTopMovies()
}


protocol NetworkingManagerOutputProtocol: class {
    // NETWORKINGMANAGER -> INTERACTOR
    func onTopMoviesRetrieved(_ movies: [MediaModel])
    func onError()
}



class MoviesInteractor: NetworkingManagerOutputProtocol {
  
  weak var presenter: MoviesInteractorOutputProtocol?
  var networkManager: NetworkingManagerInputProtocol?
  
  func onTopMoviesRetrieved(_ movies: [MediaModel]) {
    presenter?.didRetrieveTopMovies(movies)
  }
  
  func onError() {
    presenter?.onError()
  }
  
  
}
