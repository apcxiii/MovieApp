//
//  MediaDetailPresenter.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation


protocol MediaDetailPresenterProtocol: class {
  var view: MediaDetailViewProtocol? { get set }
  var router: MediaDetailRouterProtocol? { get set }
  var media: MediaModel? { get set }
  var interactor: MediaDetailInteractorInputProtocol? { get set }
  // VIEW -> PRESENTER
  func viewDidLoad()
}


class MediaDetailPresenter: MediaDetailPresenterProtocol, MediaDetailInteractorOutputProtocol {  
  var view: MediaDetailViewProtocol?
  var router: MediaDetailRouterProtocol?
  var media: MediaModel?
  var interactor: MediaDetailInteractorInputProtocol?
  
  func viewDidLoad() {
    if let media = media {
      view?.showMediaDetail(forMedia: media)
      if media.title != nil {
        interactor?.retrieveMovieVideos(media.id!)
      }else if media.name != nil {
        interactor?.retrieveTVShowVideos(media.id!)
      }
      
    }    
  }
  
  func didRetrieveTVShowVideos(_ videos: [VideoModel]) {
    view?.hideLoading()
    view?.showTVShowVideoList(videos: videos)
  }
  
  func didRetrieveMovieVideos(_ videos: [VideoModel]) {
    view?.hideLoading()
    view?.showMovieVideoList(videos: videos)
  }
  
  func onError() {
    view?.hideLoading()
    view?.showError()
  }
}

