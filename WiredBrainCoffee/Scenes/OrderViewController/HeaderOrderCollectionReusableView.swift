//
//  OrderCollectionReusableView.swift
//  WiredBrainCoffee
//
//  Created by rezo on 3/28/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class HeaderOrderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var sectionHeaderLabel: UILabel!

    func setup(count: Int) {
        sectionHeaderLabel.text = "Colors count is : \(count)"
    }
}
