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
UITableViewDataSource, UITableViewDelegate,
UISearchResultsUpdating, UISearchBarDelegate {
  
  
  
  
  
  @IBOutlet weak var tableView: UITableView!
  var presenter: SearchMediaPresenterProtocol?
  var mediaList = [MediaModel]()
  let searchController = UISearchController(searchResultsController: nil)
  var accessoryDoneButton: UIBarButtonItem!
  let accessoryToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Search"
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieCell")
    self.tableView.register(UINib(nibName: "MediaCell", bundle: nil), forCellReuseIdentifier: "MediaCell")
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.tableFooterView = UIView()
    self.setupSearchController()
    
  }
  
  private func setupSearchController() -> Void {
    self.searchController.searchResultsUpdater = self
    self.searchController.view.backgroundColor = .clear
    self.searchController.dimsBackgroundDuringPresentation = false
    self.searchController.hidesNavigationBarDuringPresentation = false
    self.extendedLayoutIncludesOpaqueBars = true
    self.definesPresentationContext = true
    self.searchController.searchBar.barTintColor = .black
    self.searchController.searchBar.placeholder = "SEARCH"
    self.searchController.searchBar.showsCancelButton = false
    self.searchController.searchBar.tintColor = .gray
    self.searchController.searchBar.delegate = self
    
    if let textfield = self.searchController.searchBar.value(forKey: "searchField") as? UITextField {
      textfield.backgroundColor = .darkGray
      textfield.font = UIFont.systemFont(ofSize: 17)
      textfield.textColor = .white
      textfield.tintColor = .darkGray
      textfield.returnKeyType = .search
      textfield.keyboardAppearance = .dark
      
      self.accessoryDoneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done,
                                                 target: self,
                                                 action: #selector(self.donePressed(_:)))
      self.accessoryDoneButton.tintColor = .lightGray
      let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
      self.accessoryToolBar.items = [flexibleSpace, self.accessoryDoneButton]
      textfield.inputAccessoryView = self.accessoryToolBar
    }
    self.tableView.tableHeaderView = self.searchController.searchBar
  }
  
  @objc func donePressed(_ sender: UIButton) -> Void {
      self.view.endEditing(true)
    self.searchController.searchBar.text = ""
    self.searchController.dismiss(animated: true, completion: nil)
    self.mediaList = []
    self.tableView.reloadData()
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
  
  //MARK:- UISearchResultsUpdating functions
  func updateSearchResults(for searchController: UISearchController) {
    if let queryText = searchController.searchBar.text, !queryText.isEmpty{
      presenter?.viewDidLoad(query: queryText)
    }
    
  }
}
