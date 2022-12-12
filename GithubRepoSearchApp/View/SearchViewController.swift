//
//  ViewController.swift
//  GithubRepoSearchApp
//
//  Created by 임성민 on 2022/12/09.
//

import UIKit

class SearchViewController: UIViewController {
    
    var viewModel = SearchViewModel()

    @IBOutlet weak var repositoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Enter Keyword"
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Search Github Repo"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

}

