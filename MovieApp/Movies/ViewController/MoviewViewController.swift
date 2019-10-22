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
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.tableFooterView = UIView()
  }
  
  
  
  func showTopMovieList(movies: [MediaModel]) {
    self.movieList = movies
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")
    let media = movieList[indexPath.row]
    cell?.textLabel?.text = media.title
    
    return cell!
  }
  
  

}
