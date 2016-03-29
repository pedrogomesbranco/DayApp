//
//  Cell.swift
//  DayApp
//
//  Created by Pedro G. Branco on 3/28/16.
//  Copyright © 2016 Pedro G. Branco. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cash: UILabel!
    @IBOutlet private weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    
}
