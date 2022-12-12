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
    let spinner = UIActivityIndicatorView(style: .large)

    @IBOutlet weak var repositoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Enter Keyword"
        navigationItem.searchController = searchController
        navigationItem.title = "Search Github Repo"
        navigationItem.hidesSearchBarWhenScrolling = false
        
        repositoryTableView.backgroundView = spinner
        spinner.hidesWhenStopped = true
        
        viewModel.searchResult.compactMap {
            $0.items
        }.bind(to: repositoryTableView.rx.items(cellIdentifier: "RepositoryCell", cellType: RepositoryCell.self)) { (index: Int, element: Item, cell: RepositoryCell) in
            cell.titleLabel?.text = element.name
            cell.descriptionLabel?.text = element.itemDescription
            if let stargazersCount = element.stargazersCount {
                cell.starCountLabel?.text = stargazersCount.commaRepresentation
            }
            if let language = element.language {
                cell.languageLabel?.text = language
                cell.languageIconImageView.tintColor = RepositoryCell.getLanguageColor(language)
            } else {
                cell.languageIconImageView.isHidden = true
            }
        }.disposed(by: disposeBag)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else { return }
        spinner.startAnimating()
        viewModel.searchRepository(keyword) {
            self.spinner.stopAnimating()
        }
    }
}

