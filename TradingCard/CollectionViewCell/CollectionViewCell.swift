//
//  CollectionViewCell.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 01/06/21.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var expireDate: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataView.layer.cornerRadius = 15.0
    }
    
    var card : Cards? {
        didSet {
            self.cardNumber.text = card?.cardNumber
            self.userName.text = card?.userName
            self.expireDate.text = card?.expiryDate
            self.cardType.text = card?.cardType
        }
    }
}
