//
//  Int+Comma.swift
//  GithubRepoSearchApp
//
//  Created by 임성민 on 2022/12/12.
//

import Foundation

extension Int {
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    internal var commaRepresentation: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
