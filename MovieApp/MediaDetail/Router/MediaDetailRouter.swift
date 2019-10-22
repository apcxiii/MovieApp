//
//  MediaDetailRouter.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

protocol MediaDetailRouterProtocol: class {
    static func createMediaDetailModule(forCar mediaModel: MediaModel) -> UIViewController
}


class MediaDetailRouter: MediaDetailRouterProtocol {
  static func createMediaDetailModule(forCar mediaModel: MediaModel) -> UIViewController {
    let view = MediaDetailViewController()
    let presenter: MediaDetailPresenterProtocol = MediaDetailPresenter()
    let router: MediaDetailRouterProtocol = MediaDetailRouter()
    
    view.presenter = presenter
    presenter.view = view
    presenter.media = mediaModel
    presenter.router = router
    
    return view
  }
  
  
}
