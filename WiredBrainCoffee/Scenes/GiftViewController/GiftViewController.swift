//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 3/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController {
    
    //height-is outlet gvaq agebuli, radgan
    @IBOutlet weak var seasonalHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var seasonalCollectionView: UICollectionView!
    
    @IBOutlet weak var thankyouCollectionView: UICollectionView!
    @IBOutlet weak var thankyouHeightConstraint: NSLayoutConstraint!
    
    var seasonalGiftCards = [GiftCardModel]()
    var thankyouDataSource: SmallGiftCardCollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seasonalCollectionView.dataSource = self //I set to it to this giftViewControol or I can represent that with the self since we already have inside a class, so now our collection view knows to use our view controller as its data source
        seasonalCollectionView.delegate = self
        
        GiftCardFunctions.getThankYouGiftCards { [weak self] (cards) in
            guard let self = self else { return }
            self.seasonalGiftCards = cards
            self.seasonalCollectionView.reloadData()
        }
        
        //
        GiftCardFunctions.getSeasonalGiftCards { [weak self] (cards) in
            guard let self = self else { return }
            self.thankyouDataSource = SmallGiftCardCollectionViewDataSource(giftcards: cards)
            self.thankyouCollectionView.dataSource = self.thankyouDataSource
            self.thankyouCollectionView.delegate = self.thankyouDataSource
            self.thankyouCollectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setHeightOfCollectionView()
    }
    
    
    func setHeightOfCollectionView() {
        let width = seasonalCollectionView.bounds.width - 30
        let height = width / 1.5
        seasonalHeightConstraint.constant = height
    }
}



/*extension aris class-stvis damatebiti funcqiebi.

 UICollectionViewDataSource protocol is responsible for providing the data and views required by a collection view.  At a minimum, all data source objects must implement the collectionView(_:numberOfItemsInSection:) and collectionView(_:cellForItemAt:) methods. These methods are responsible for returning the number of items in the collection view along with the items themselves.

 UICollectionViewDelegateFlowLayout The methods of this protocol define the size of items and the spacing between items in the grid.
 delegati aris shemdegnairad roca dachirdeba viewControlles miakitxavs da waigebs
*/
extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //default method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasonalGiftCards.count
    }
    
    //default method
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        cell.setup(giftCardModel: seasonalGiftCards[indexPath.item])
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout method, that return card size in our view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = seasonalCollectionView.bounds.width - 50 //50 vaklebt imitom rom gamochndes meore baratis dasawyisi
        let height = width / 1.5 // card-is zoma aris 500#750ze amitom vyoft 1.5ze
        return CGSize(width: width, height: height)
    }
}
