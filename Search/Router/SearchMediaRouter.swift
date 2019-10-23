//
//  SearchMediaRouter.swift
//  MovieApp
//
//  Created by Erik on 22/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

protocol SearchMediaRouterProtocol: class {
  static func createMoviesModule(sourceMediaType: Int) -> UIViewController
  // PRESENTER -> ROUTER
  func presentMovieDetailScreen(from view: SearchMediaViewProtocol, forMedia media: MediaModel)
}


class SearchMediaRouter: SearchMediaRouterProtocol {
  func presentMovieDetailScreen(from view: SearchMediaViewProtocol, forMedia media: MediaModel) {
    let mediaDetailViewController = MediaDetailRouter.createMediaDetailModule(forMedia: media)
    if let sourceView = view as? UIViewController {
      sourceView.navigationController?.pushViewController(mediaDetailViewController, animated: true)
    }
  }
  
  static func createMoviesModule(sourceMediaType: Int) -> UIViewController {
    let searchViewController = SearchMediaViewController(nibName: "SearchMediaViewController", bundle: nil)
    let presenter: SearchMediaPresenterProtocol & SearchMediaInteractorOutputProtocol = SearchMediaPresenter()
    let interactor: SearchMediaInteractorInputProtocol & NetworkingManagerOutputProtocol = SearchMediaInteractor()
    let networkManager: NetworkingManagerInputProtocol = NetworkingManger()
    let router: SearchMediaRouterProtocol = SearchMediaRouter()
    interactor.sourceMadiaType = sourceMediaType
    
    searchViewController.presenter = presenter
    presenter.view = searchViewController
    presenter.router = router
    presenter.sourceMediaType = sourceMediaType
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.networkManager = networkManager
    networkManager.remoteRequestHandler = interactor
    
    return searchViewController
  }
  
 
}
