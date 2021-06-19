//
//  AlertView.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 02/06/21.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String)  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            //Ok Action
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
