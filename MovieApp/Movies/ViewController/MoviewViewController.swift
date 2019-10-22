//
//  MoviewViewController.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import PKHUD
protocol MoviesViewProtocol: class {
  var presenter: MoviesPresenterProtocol? { get set }
  
  // PRESENTER -> VIEW
  func showTopMovieList(movies: [MediaModel])
  func showPopularMovieList(movies: [MediaModel])
  func showUpcomingMovieList(movies: [MediaModel])
  func showTopTvShowList(tvShows: [MediaModel])
  func showPopularTVShowList(tvShows: [MediaModel])
  func showError()
  func showLoading()
  func hideLoading()
}


class MoviesViewController: UIViewController, MoviesViewProtocol,
UITableViewDelegate, UITableViewDataSource {
  
  
  
  
  @IBOutlet weak var tableView: UITableView!
  var presenter: MoviesPresenterProtocol?
  var movieList = [MediaModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieCell")
    self.tableView.register(UINib(nibName: "MediaCell", bundle: nil), forCellReuseIdentifier: "MediaCell")
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.tableFooterView = UIView()
  }
  
  
  
  func showTopMovieList(movies: [MediaModel]) {
    self.title = "Top Rated Movies"
    self.movieList = movies
    self.tableView.reloadData()
  }
  
  func showPopularMovieList(movies: [MediaModel]) {
    self.title = "Popular Movies"
    self.movieList = movies
    self.tableView.reloadData()
  }
  
  func showUpcomingMovieList(movies: [MediaModel]) {
    self.title = "Upcoming Movies"
    self.movieList = movies
    self.tableView.reloadData()
  }
  
  
  func showTopTvShowList(tvShows: [MediaModel]) {
    self.title = "Top Rated TV Shows"
    self.movieList = tvShows
    self.tableView.reloadData()
  }
  
  func showPopularTVShowList(tvShows: [MediaModel]) {
    self.title = "Popular TV Shows"
    self.movieList = tvShows
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
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.movieList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell",
                                             for: indexPath) as! MediaCell    
    let media = movieList[indexPath.row]
    cell.bind(mediaModel: media)
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let mediaModel = self.movieList[indexPath.row]
    presenter?.showMediaDetail(forMedia: mediaModel)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 240
  }
  
  
}
