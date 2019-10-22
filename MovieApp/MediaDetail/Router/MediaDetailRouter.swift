//
//  MediaDetailRouter.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

protocol MediaDetailRouterProtocol: class {
    static func createMediaDetailModule(forMedia mediaModel: MediaModel) -> UIViewController
}


class MediaDetailRouter: MediaDetailRouterProtocol {
  static func createMediaDetailModule(forMedia mediaModel: MediaModel) -> UIViewController {
    let view = MediaDetailViewController()
    let interactor: MediaDetailInteractorInputProtocol & NetworkingManagerOutputProtocol = MediaDetailInteractor()
    
    let presenter: MediaDetailPresenterProtocol & MediaDetailInteractorOutputProtocol = MediaDetailPresenter()
    let router: MediaDetailRouterProtocol = MediaDetailRouter()
    let networkManager: NetworkingManagerInputProtocol = NetworkingManger()
    view.presenter = presenter
    presenter.view = view
    presenter.media = mediaModel
    presenter.router = router
    presenter.interactor = interactor
    interactor.networkManager = networkManager
    interactor.presenter = presenter
    networkManager.remoteRequestHandler = interactor
    
    return view
  }
  
  
}
