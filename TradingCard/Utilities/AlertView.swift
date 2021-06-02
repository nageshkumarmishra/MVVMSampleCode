//
//  AlertView.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 02/06/21.
//

import UIKit

struct AlertView {
    
    func showAlert(title: String, message: String, viewController: UIViewController )  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            //Ok Action
        }))
        viewController.present(alert, animated: true, completion: nil)
    }
}
