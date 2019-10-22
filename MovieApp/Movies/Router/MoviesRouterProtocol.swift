//
//  MoviesRouterProtocol.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

protocol MoviesRouterProtocol: class {
    static func createMoviesModule() -> UIViewController
    // PRESENTER -> ROUTER
    func presentMovieDetailScreen(from view: MoviesViewProtocol, forCar media: MediaModel)
}



class MoviesRouter: MoviesRouterProtocol {
  func presentMovieDetailScreen(from view: MoviesViewProtocol, forCar media: MediaModel) {
    let mediaDetailViewController = MediaDetailRouter.createMediaDetailModule(forCar: media)
    if let sourceView = view as? UIViewController {
      sourceView.navigationController?.pushViewController(mediaDetailViewController, animated: true)
    }
  }
  
  class func createMoviesModule() -> UIViewController {
    
    let moviesViewController = MoviesViewController(nibName: "MoviesViewController", bundle: nil)
    
    let presenter: MoviesPresenterProtocol & MoviesInteractorOutputProtocol = MoviesPresenter()
    let interactor: MoviesInteractorInputProtocol & NetworkingManagerOutputProtocol = MoviesInteractor()
    let networkManager: NetworkingManagerInputProtocol = NetworkingManger()
    let router: MoviesRouterProtocol = MoviesRouter()
    
    moviesViewController.presenter = presenter
    presenter.view = moviesViewController
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.networkManager = networkManager
    networkManager.remoteRequestHandler = interactor
    
    
    return moviesViewController
  }
}
