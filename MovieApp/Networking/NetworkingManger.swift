//
//  NetworkingManger.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol NetworkingManagerInputProtocol: class {  
  var remoteRequestHandler: NetworkingManagerOutputProtocol? { get set }
  
  // INTERACTOR -> NETWORKINGMANAGER
  func retrieveTopMovies()
}

protocol NetworkingManagerOutputProtocol: class {
  // NETWORKINGMANAGER -> INTERACTOR
  func onTopMoviesRetrieved(_ movies: [MediaModel])
  func onError()
}


class NetworkingManger: NetworkingManagerInputProtocol {
  var remoteRequestHandler: NetworkingManagerOutputProtocol?
  
  func retrieveTopMovies() {
    //perform an HTTP GET request with the provided url
    Alamofire.request(APIV3Url.MoviesPopularList.fetch.url, method: .get)
      .validate()//automatic validation checks that the response returns a valid HTTP Code between 200 and 299
      .responseObject { (response: DataResponse<MediaResponse>) in
        switch response.result {
        case .success(_):
          if let mediaResponse = response.result.value {
            self.remoteRequestHandler?.onTopMoviesRetrieved(mediaResponse.results!)
          }
        case .failure(_):
          self.remoteRequestHandler?.onError()
        }
    }
    
  }
  
  
  
}
