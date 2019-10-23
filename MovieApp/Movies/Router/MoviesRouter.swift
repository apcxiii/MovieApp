//
//  MoviesRouterProtocol.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

protocol MoviesRouterProtocol: class {
  static func createMoviesModule(sourceMediaType: Int) -> UIViewController
  // PRESENTER -> ROUTER
  func presentMovieDetailScreen(from view: MoviesViewProtocol, forMedia media: MediaModel)
}



class MoviesRouter: MoviesRouterProtocol {  
  func presentMovieDetailScreen(from view: MoviesViewProtocol, forMedia media: MediaModel) {
    let mediaDetailViewController = MediaDetailRouter.createMediaDetailModule(forMedia: media)
    if let sourceView = view as? UIViewController {
      sourceView.navigationController?.pushViewController(mediaDetailViewController, animated: true)
    }
  }
  
  class func createMoviesModule(sourceMediaType: Int) -> UIViewController {
    
    let moviesViewController = MoviesViewController(nibName: "MoviesViewController", bundle: nil)
    
    let presenter: MoviesPresenterProtocol & MoviesInteractorOutputProtocol = MoviesPresenter()
    let interactor: MoviesInteractorInputProtocol & NetworkingManagerOutputProtocol = MoviesInteractor()
    interactor.sourceMadiaType = sourceMediaType
    let networkManager: NetworkingManagerInputProtocol = NetworkingManger()
    let router: MoviesRouterProtocol = MoviesRouter()
    
    moviesViewController.presenter = presenter
    presenter.view = moviesViewController
    presenter.router = router
    presenter.sourceMediaType = sourceMediaType
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.networkManager = networkManager
    networkManager.remoteRequestHandler = interactor
    
    
    return moviesViewController
  }
}
