//
//  MediaDetailViewController.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import PKHUD
import YouTubePlayer_Swift

protocol MediaDetailViewProtocol: class {
  var presenter: MediaDetailPresenterProtocol? { get set }
  
  // PRESENTER -> VIEW
  func showMediaDetail(forMedia mediaModel: MediaModel)
  func showMovieVideoList(videos: [VideoModel])
  func showTVShowVideoList(videos: [VideoModel])
  func showError()
  func showLoading()
  func hideLoading()
}

class MediaDetailViewController: UIViewController, MediaDetailViewProtocol {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  @IBOutlet weak var originalTitleLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  @IBOutlet weak var originalLanguageLabel: UILabel!  
  @IBOutlet weak var videoPlayer: YouTubePlayerView!
  var presenter: MediaDetailPresenterProtocol?
  var youtubeId: String?
  
  func showMediaDetail(forMedia mediaModel: MediaModel) {
    
    if mediaModel.title != nil {
      self.titleLabel.text = mediaModel.title
    }else{
      self.titleLabel.text = mediaModel.name
    }
    if mediaModel.releaseDate != nil {
      self.dateLabel.text = "Release Date"
      self.releaseDateLabel.text = mediaModel.releaseDate
    }else{
      self.dateLabel.text = "First Air Date"
      self.releaseDateLabel.text = mediaModel.firstAirDate
    }
    
    if mediaModel.originalTitle != nil {
      self.originalTitleLabel.text = mediaModel.originalTitle
    }else {
      self.originalTitleLabel.text = mediaModel.originalName
    }
    
    self.overviewLabel.text = mediaModel.overview
    self.originalLanguageLabel.text = mediaModel.originalLanguage?.uppercased()
    if mediaModel.backdropPath != nil{
      imageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(mediaModel.backdropPath!)")!)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.presenter?.viewDidLoad()
    self.title = "Detail"    
  }
  
  func showError() {
    HUD.flash(.label("Error"), delay: 2.0)
  }
  
  func showLoading() {
    HUD.show(.progress)
  }
  
  func hideLoading() {
    HUD.hide()
  }
  
  
  func showMovieVideoList(videos: [VideoModel]) {
    
    if let firstVideoYoutube = videos.first(where: {$0.site == "YouTube"}){
      self.youtubeId = firstVideoYoutube.key
      videoPlayer.playerVars = ["playsinline": "1" as AnyObject]
      if firstVideoYoutube.key != nil {
        videoPlayer.loadVideoID(firstVideoYoutube.key!)
      }
    }
  }
  
  func showTVShowVideoList(videos: [VideoModel]) {
    if let firstVideoYoutube = videos.first(where: {$0.site == "YouTube"}){
      videoPlayer.playerVars = ["playsinline": "1" as AnyObject]
      if firstVideoYoutube.key != nil {
        videoPlayer.loadVideoID(firstVideoYoutube.key!)
      }
    }
  }
  
}
