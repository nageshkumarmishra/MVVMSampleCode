//
//  Cards.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 01/06/21.
//

import Foundation

struct TradingCards : Codable {
    let status : Int?
    let cards : [Cards]?
}

struct Cards : Codable {
    let cardNumber : String?
    let userName : String?
    let expiryDate : String?
    let cardDetails : String?
    let cardType : String?
    var isItemSelected : Bool?

}
