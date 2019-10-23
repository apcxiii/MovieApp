//
//  MediaDetailIteractor.swift
//  MovieApp
//
//  Created by Erik on 22/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

protocol MediaDetailInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  func didRetrieveTVShowVideos(_ videos: [VideoModel])
  func didRetrieveMovieVideos(_ videos: [VideoModel])
  func onError()
}


protocol MediaDetailInteractorInputProtocol: class {
  var presenter: MediaDetailInteractorOutputProtocol? { get set }
  var networkManager: NetworkingManagerInputProtocol? { get set }
  var sourceMadiaType: Int {get set}
  
  // PRESENTER -> INTERACTOR
  func retrieveMovieVideos(_ id: Int)
  func retrieveTVShowVideos(_ id: Int)
}

class MediaDetailInteractor: MediaDetailInteractorInputProtocol, NetworkingManagerOutputProtocol{
  var sourceMadiaType: Int = 0  
  var presenter: MediaDetailInteractorOutputProtocol?
  var networkManager: NetworkingManagerInputProtocol?
  
  func retrieveMovieVideos(_ id: Int) {
    networkManager?.retrieveMovieVideos(id: id)
  }
  
  func retrieveTVShowVideos(_ id: Int) {
    networkManager?.retrieveTVShowsVideos(id: id)
  }
  
  func onTopMoviesRetrieved(_ movies: [MediaModel]) {
    //nothig to do
  }
  
  func onPopularMoviesRetrieved(_ movies: [MediaModel]) {
    //nothig to do
  }
  
  func onUpcomingMoviesRetrieved(_ movies: [MediaModel]) {
    //nothig to do
  }
  
  func onTopTVShowsRetrieved(_ tvShows: [MediaModel]) {
    //nothig to do
  }
  
  func onPopularTVShowsRetrieved(_ tvShows: [MediaModel]) {
    //nothig to do
  }
  
  func onTVShowVideosRetrieved(_ videos: [VideoModel]) {
    presenter?.didRetrieveTVShowVideos(videos)
  }
  
  func onMovieVideosRetrieved(_ videos: [VideoModel]) {
    presenter?.didRetrieveMovieVideos(videos)
  }
  
  func onTVShowSearchRetrieved(_ tvShows: [MediaModel]) {
    
  }
  
  func onMoviewSearchRetrieved(_ movies: [MediaModel]) {
    
  }
  
  func onError() {
    presenter?.onError()
  }
  
  
}
