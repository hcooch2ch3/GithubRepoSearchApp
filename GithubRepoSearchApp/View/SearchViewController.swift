//
//  ViewController.swift
//  GithubRepoSearchApp
//
//  Created by 임성민 on 2022/12/09.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    var viewModel = SearchViewModel()
    private let disposeBag = DisposeBag()

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
        
        viewModel.searchResult.compactMap {
            $0.items
        }.bind(to: repositoryTableView.rx.items(cellIdentifier: "RepositoryCell", cellType: RepositoryCell.self)) { (index: Int, element: Item, cell: RepositoryCell) in
            cell.titleLabel?.text = element.name
            cell.descriptionLabel?.text = element.itemDescription
        }.disposed(by: disposeBag)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else { return }
        viewModel.searchRepository(keyword)
    }
}

