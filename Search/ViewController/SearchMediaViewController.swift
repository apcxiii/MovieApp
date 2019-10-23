//
//  SearchMediaViewController.swift
//  MovieApp
//
//  Created by Erik on 22/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import PKHUD

protocol SearchMediaViewProtocol: class {
  var presenter: SearchMediaPresenterProtocol? { get set }
  func showSearchMovieList(movies: [MediaModel])
  func showSearchTVShowList(movies: [MediaModel])
  func showError()
  func showLoading()
  func hideLoading()
}

class SearchMediaViewController: UIViewController, SearchMediaViewProtocol,
UITableViewDataSource, UITableViewDelegate {
  
  
  
  @IBOutlet weak var tableView: UITableView!
  var presenter: SearchMediaPresenterProtocol?
  var mediaList = [MediaModel]()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.presenter?.viewDidLoad()
    self.title = "Search"
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieCell")
    self.tableView.register(UINib(nibName: "MediaCell", bundle: nil), forCellReuseIdentifier: "MediaCell")
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.tableFooterView = UIView()
  }
  
  
  func showSearchMovieList(movies: [MediaModel]) {
    self.title = "Search Movies"
    self.mediaList = movies
    self.tableView.reloadData()
  }
  
  func showSearchTVShowList(movies: [MediaModel]) {
    self.title = "Search TV Shows"
    self.mediaList = movies
    self.tableView.reloadData()
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
  
  
  //MARK:- UITableViewDelegate & UITableViewDataSource functions
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.mediaList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell",
                                             for: indexPath) as! MediaCell
    let media = mediaList[indexPath.row]
    cell.bind(mediaModel: media)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let mediaModel = self.mediaList[indexPath.row]
    presenter?.showMediaDetail(forMedia: mediaModel)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 240
  }
  
}
