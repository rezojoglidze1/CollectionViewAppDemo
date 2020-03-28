//
//  SmallGiftCardCollectionViewDataSource.swift
//  WiredBrainCoffee
//
//  Created by rezo on 3/28/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit
//NSObject is a "universal base class" ("doensot inherit from orher classes"). all objects in IOS apps ultimately inherit from NSObject

class SmallGiftCardCollectionViewDataSource: NSObject,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    fileprivate var giftCards = [GiftCardModel]()
    
    init(giftcards: [GiftCardModel]) {
        self.giftCards = giftcards
    }

    //default method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftCards.count
    }
    
    //default method
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        cell.setup(giftCardModel: giftCards[indexPath.item])
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout method, that return card size in our view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width / 2 - 50 //50 vaklebt imitom rom gamochndes meore baratis dasawyisi
        let height = width / 1.5 // card-is zoma aris 500#750ze amitom vyoft 1.5ze
        return CGSize(width: width, height: height)
    }
}
