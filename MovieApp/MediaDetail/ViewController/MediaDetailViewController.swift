//
//  MediaDetailViewController.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

protocol MediaDetailViewProtocol: class {
  var presenter: MediaDetailPresenterProtocol? { get set }
  
  // PRESENTER -> VIEW
  func showMediaDetail(forMedia mediaModel: MediaModel)
}

class MediaDetailViewController: UIViewController, MediaDetailViewProtocol {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  
  func showMediaDetail(forMedia mediaModel: MediaModel) {
    self.titleLabel.text = mediaModel.title
    self.releaseDateLabel.text = mediaModel.releaseDate
  }
  
  
  var presenter: MediaDetailPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.presenter?.viewDidLoad()
  }
  
}
