//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  
  
  @IBOutlet weak var tableView: UITableView!
  
  let options: [String] = ["Movies", "TV Shows"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupView()
    // Do any additional setup after loading the view.
  }
  
  
  private func setupView() -> Void {
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.tableFooterView = UIView()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "OptionCell")
    self.title = "Movies & TV Shows"
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.options.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell")
    cell?.textLabel?.text = self.options[indexPath.row]
    return cell!
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if indexPath.row == 0 {
      let moviesMenuViewController = MoviesMenuViewController(nibName: "TVShowsMenuViewController",
      bundle: nil)
      
      self.navigationController?.pushViewController(moviesMenuViewController, animated: true)
      
    }else if indexPath.row == 1 {
      
      let menuTVShowsViewController = TVShowsMenuViewController(nibName: "TVShowsMenuViewController",
      bundle: nil)
      
      self.navigationController?.pushViewController(menuTVShowsViewController, animated: true)
      
    }
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
