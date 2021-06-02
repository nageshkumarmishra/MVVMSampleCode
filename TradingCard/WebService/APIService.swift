//
//  APIService.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 01/06/21.
//

import Foundation
import UIKit

enum APIStatus : Error {
    case pass
    case fail
}

struct APIService {
    
    private let urlString = URL(string: "https://mocki.io/v1/e93144a0-0c50-4cb4-b13b-f031613fe61e")!
    
    // GetCards will fetch data from a server and parse it using the Codable
    func getCards(completion: @escaping ((_ data: TradingCards?, _ success: APIStatus) -> Void)) {
        var aboutCanadaData: TradingCards?
        // Using URLSession to make an api request
        URLSession.shared.dataTask(with: urlString) { (dataResponse, urlResponse, error) in
            guard let dataResponse = dataResponse else {
                completion(nil, .fail) // The data is nil then send fail status
                return
            }
            do {
                aboutCanadaData = try JSONDecoder().decode(TradingCards.self, from: dataResponse)
                completion(aboutCanadaData, .pass)
            }  catch let err {
                print(err)
                completion(nil, .fail) // If any error occurs send then fail status
            }
        }.resume()
    }
}
