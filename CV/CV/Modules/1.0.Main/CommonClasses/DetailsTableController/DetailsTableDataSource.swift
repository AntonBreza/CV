//
//  DetailsTableDataSource.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

protocol DetailsTableDataSource {
    var rowsCount: Int { get }
    var title: String { get }
    func setupCell(_ cell: UITableViewCell, at indexPath: IndexPath)
}

