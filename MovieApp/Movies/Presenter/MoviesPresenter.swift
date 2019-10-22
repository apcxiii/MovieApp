//
//  MoviesPresenter.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

protocol MoviesPresenterProtocol: class {
  var view: MoviesViewProtocol? { get set }
  var interactor: MoviesInteractorInputProtocol? { get set }
  var router: MoviesRouterProtocol? { get set }
  var sourceMediaType: Int {get set}
  
  // VIEW -> PRESENTER
  func viewDidLoad()
  func showMediaDetail(forMedia mediaModel: MediaModel)
  
}


class MoviesPresenter: MoviesPresenterProtocol, MoviesInteractorOutputProtocol {
  
  
  
  weak var view: MoviesViewProtocol?  
  var interactor: MoviesInteractorInputProtocol?
  var router: MoviesRouterProtocol?
  var sourceMediaType: Int = 0
  
  func viewDidLoad() {
    view?.showLoading()
    switch sourceMediaType {
    case SourceMediaType.topMovies.rawValue:
      interactor?.retrieveTopMovies()
    case SourceMediaType.popularMovies.rawValue:
      interactor?.retrievePopularMovies()
    default:
      interactor?.retriveUpcomingMovies()
    }
    
  }
  
  func showMediaDetail(forMedia mediaModel: MediaModel) {
    if let view = view {
      router?.presentMovieDetailScreen(from: view, forCar: mediaModel)
    }
  }
  
  
  func didRetrieveTopMovies(_ movies: [MediaModel]) {
    view?.hideLoading()
    view?.showTopMovieList(movies: movies)
  }
  
  func didRetrieveUpcomingMovies(_ movies: [MediaModel]) {
    view?.hideLoading()
    view?.showUpcomingMovieList(movies: movies)
  }
  
  func didRetrievePopularMovies(_ movies: [MediaModel]) {
    view?.hideLoading()
    view?.showPopularMovieList(movies: movies)
  }
  
  
  func onError() {
    view?.hideLoading()
    view?.showError()
  }
  
}
