//
//  MoviesMenuViewController.swift
//  MovieApp
//
//  Created by Erik on 21/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class MoviesMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   @IBOutlet weak var tableView: UITableView!
    let options: [String] = ["Popular", "Top Rated", "Upcomming", "Search"]
    
    override func viewDidLoad() {
      super.viewDidLoad()
      self.setupView()
    }
    
    private func setupView() -> Void {
      self.title = "Movies"
      self.tableView.delegate = self
      self.tableView.dataSource = self
      self.tableView.tableFooterView = UIView()
      self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "OptionCell")
      
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
    let router = MoviesRouter.createMoviesModule()
    self.navigationController?.pushViewController(router, animated: true)
    self.tableView.deselectRow(at: indexPath, animated: true)
  }
    

}
