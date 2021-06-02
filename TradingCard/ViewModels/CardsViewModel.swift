//
//  CardsViewModel.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 01/06/21.
//

import Foundation

protocol CardsViewModelErrorDelegate : class {
    func failStatus()
}

class CardsViewModel : NSObject {
    var apiService : APIService?
    var bindViewModelToController : (() -> ()) = {}
    var delegate : CardsViewModelErrorDelegate? = nil
    
    private(set) var dataFeed : TradingCards? {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    override init() {
        super.init()
        self.apiService = APIService()
        self.fetchData()
    }
    
    // Fetch data from API
    func fetchData() {
        self.apiService?.getCards {(dataValue, status)  in
            switch status {
            case .pass:
                self.dataFeed = dataValue
                break
            case .fail:
                self.delegate?.failStatus()
                break
            }
        }
    }
}
