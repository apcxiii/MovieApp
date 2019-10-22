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
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showMediaDetail(forMedia mediaModel: MediaModel)

}


class MoviesPresenter: MoviesPresenterProtocol, MoviesInteractorOutputProtocol {
  var view: MoviesViewProtocol?  
  var interactor: MoviesInteractorInputProtocol?
  
  var router: MoviesRouterProtocol?
  
  func viewDidLoad() {
    view?.showLoading()
    interactor?.retrieveTopMovies()
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
  
  func onError() {
    view?.hideLoading()
    view?.showError()
  }
  
}
