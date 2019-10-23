//
//  SearchMediaPresenter.swift
//  MovieApp
//
//  Created by Erik on 22/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

protocol SearchMediaPresenterProtocol: class {
  var view: SearchMediaViewProtocol? { get set }
  var interactor: SearchMediaInteractorInputProtocol? { get set }
  var media: MediaModel? { get set }
  var router: SearchMediaRouterProtocol? { get set }
  var sourceMediaType: Int {get set}
  
  // VIEW -> PRESENTER
  func viewDidLoad(query: String)
  func showMediaDetail(forMedia mediaModel: MediaModel)
  
}

class SearchMediaPresenter: SearchMediaPresenterProtocol, SearchMediaInteractorOutputProtocol {
  
  
  var view: SearchMediaViewProtocol?
  var router: SearchMediaRouterProtocol?
  var interactor: SearchMediaInteractorInputProtocol?
  var media: MediaModel?
  var sourceMediaType: Int = 0
  
  func viewDidLoad(query: String) {
    view?.showLoading()
    if sourceMediaType == SourceMediaType.searchMovies.rawValue {
      interactor?.retrieveSearchMovies(query: query)
    }else if sourceMediaType == SourceMediaType.searchTVShows.rawValue {
      interactor?.retrieveSearchTVShows(query: query)
    }
    
  }
  
  func showMediaDetail(forMedia mediaModel: MediaModel) {
    if let view = view {
      router?.presentMovieDetailScreen(from: view, forMedia: mediaModel)
    }
  }
  
  func didRetrieveSearchMovies(_ movies: [MediaModel]) {
    view?.hideLoading()
    view?.showSearchMovieList(movies: movies)
  }
  
  func didRetrieveSearchTVShows(_ tvShows: [MediaModel]) {
    view?.hideLoading()
    view?.showSearchTVShowList(movies: tvShows)
  }
  
  func onError() {
    view?.hideLoading()
    view?.showError()
  }
  
}
