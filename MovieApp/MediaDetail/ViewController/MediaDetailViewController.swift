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
  @IBOutlet weak var originalTitleLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  @IBOutlet weak var originalLanguageLabel: UILabel!
  
  func showMediaDetail(forMedia mediaModel: MediaModel) {
    self.titleLabel.text = mediaModel.title
    self.releaseDateLabel.text = mediaModel.releaseDate
    self.originalTitleLabel.text = mediaModel.originalTitle
    self.overviewLabel.text = mediaModel.overview
    self.originalLanguageLabel.text = mediaModel.originalLanguage?.uppercased()
    if mediaModel.backdropPath != nil{
      imageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(mediaModel.backdropPath!)")!)
    }
  }
  
  
  var presenter: MediaDetailPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.presenter?.viewDidLoad()
    self.title = "Detail"
  }
  
}
