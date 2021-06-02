//
//  CollectionViewCell.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 01/06/21.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    static let cornerRadius: CGFloat = 15.0
    
    private var spinTimeInterval = 0.5
    
    @IBOutlet weak var dataDetailView: UIView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var expireDate: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardDetailTextView: UITextView!
    
    var card : Cards? {
        didSet {
            self.cardNumber.text = card?.cardNumber
            self.userName.text = card?.userName
            self.expireDate.text = card?.expiryDate
            self.cardType.text = card?.cardType
           self.cardDetailTextView.text = card?.cardDetails
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataView.layer.cornerRadius = DataCollectionViewCell.cornerRadius
        self.dataDetailView.layer.cornerRadius = DataCollectionViewCell.cornerRadius
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(flipTapped))
        self.addGestureRecognizer(singleTap)
        
    }
    
    @objc func flipTapped() {
        flip(displayItem: card!)
    }
    
    func flip(displayItem: Cards) {
        var displayFlipItem = displayItem
        
        guard let isItemSelected = displayFlipItem.isItemSelected else {
            return
        }
        dataView.isHidden = !isItemSelected
        dataDetailView.isHidden = isItemSelected
        
        UIView.transition(from:isItemSelected ? dataView : dataDetailView,
                          to: isItemSelected ? dataView : dataDetailView,
                          duration: spinTimeInterval,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews])
        
        displayFlipItem.isItemSelected = !isItemSelected
        self.card = displayFlipItem
    }
}
