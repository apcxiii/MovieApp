//
//  MediaCell.swift
//  MovieApp
//
//  Created by Erik on 22/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class MediaCell: UITableViewCell {
  
  @IBOutlet weak var imageMediaView: UIImageView!
  @IBOutlet weak var titleMediaLabel: UILabel!
  @IBOutlet weak var releaseDate: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.setupView()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  
  private func setupView() -> Void {
    self.imageView?.layer.cornerRadius = 8.0
    self.imageView?.layer.borderWidth = 1
    self.imageView?.layer.borderColor = UIColor.lightGray.cgColor
    self.contentView.layer.cornerRadius = 4.0
    
  }
  
  func bind(mediaModel: MediaModel) -> Void {
    
    if mediaModel.posterPath != nil{
      imageMediaView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(mediaModel.posterPath!)")!)
    }
    if mediaModel.title != nil {
        self.titleMediaLabel.text = mediaModel.title
    }else{
      self.titleMediaLabel.text = mediaModel.name
    }
    
    if mediaModel.releaseDate != nil {
      self.releaseDate.text = mediaModel.releaseDate
    }else{
      self.releaseDate.text = mediaModel.firstAirDate
    }
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()    
  }
  
}
