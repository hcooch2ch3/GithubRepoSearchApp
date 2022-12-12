//
//  RepositoryCell.swift
//  GithubRepoSearchApp
//
//  Created by 임성민 on 2022/12/12.
//

import UIKit

class RepositoryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageIconImageView: UIImageView!
    
    static func getLanguageColor(_ language: String) -> UIColor {
        var color: UIColor = .systemBrown
        switch language {
        case "Swift":
            color = .systemRed
        case "Python":
            color = .systemBlue
        case "Java":
            color = .systemOrange
        case "JavaScript":
            color = .systemYellow
        default:
            break
        }
        return color
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        descriptionLabel.text = nil
        starCountLabel.text = nil
        languageLabel.text = nil
        languageIconImageView.isHidden = false
    }
}
