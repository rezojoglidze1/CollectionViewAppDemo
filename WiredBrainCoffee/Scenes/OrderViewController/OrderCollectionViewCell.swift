//
//  OrderCollectionViewCell.swift
//  WiredBrainCoffee
//
//  Created by rezo on 3/28/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var orderCollectionViewTextlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    func setup(backgroundColor: UIColor, count: Int){
        self.backgroundColor = backgroundColor
        orderCollectionViewTextlabel.text = "\(count)"
        orderCollectionViewTextlabel.layer.shadowOpacity = 0.7
        orderCollectionViewTextlabel.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
}
