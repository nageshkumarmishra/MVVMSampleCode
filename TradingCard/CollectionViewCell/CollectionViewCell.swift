//
//  CollectionViewCell.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 01/06/21.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    private var spinTimeInterval = 0.5
    
    @IBOutlet weak var dataDetailView: UIView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var expireDate: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardDetailLabel: UILabel!
    
    var card : Cards? {
        didSet {
            self.cardNumber.text = card?.cardNumber
            self.userName.text = card?.userName
            self.expireDate.text = card?.expiryDate
            self.cardType.text = card?.cardType
            self.cardDetailLabel.text = card?.cardDetails
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataView.layer.cornerRadius = 15.0
        self.dataDetailView.layer.cornerRadius = 15.0
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(flipTapped))
        self.addGestureRecognizer(singleTap)
        
    }
    
    @objc func flipTapped() {
        flip(displayItem: card!)
    }
    
    func flip(displayItem: Cards) {
        var displayFlipItem = displayItem
        dataView.isHidden = !displayFlipItem.isItemSelected!
        dataDetailView.isHidden = displayFlipItem.isItemSelected!
        
        UIView.transition(from: displayFlipItem.isItemSelected! ? dataView : dataDetailView,
                          to: displayFlipItem.isItemSelected! ? dataView : dataDetailView,
                          duration: spinTimeInterval,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews])
        
        displayFlipItem.isItemSelected = !displayFlipItem.isItemSelected!
        self.card = displayFlipItem
    }
}
