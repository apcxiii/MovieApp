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
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}


class MediaDetailPresenter: MediaDetailPresenterProtocol {
  var view: MediaDetailViewProtocol?
  var router: MediaDetailRouterProtocol?
  var media: MediaModel?
  
  func viewDidLoad() {
    if let media = media {
        view?.showMediaDetail(forMedia: media)
    }
    
  }
  
  
}

