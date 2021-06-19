//
//  ViewController.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 31/05/21.
//

import UIKit

struct Constant {
    static let collectionHeight : CGFloat = 141.0
    static let minimumLineSpacing : CGFloat = 4.0
    static let minimumInterimSpacing : CGFloat = 1
}


class ViewController: UICollectionViewController {
    
    static let cellIdentifier =  "reuseIdentifier"
    
    private var cardsViewModel : CardsViewModel!
    private var dataSource : CollectionViewDataSource<DataCollectionViewCell,Cards>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        self.cardsViewModel =  CardsViewModel()
        self.cardsViewModel.delegate = self
        self.cardsViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = CollectionViewDataSource(ViewController.cellIdentifier, items: self.cardsViewModel.dataFeed?.cards, configureCell: { (cell, data) in
            cell.card = data
        })
        
        DispatchQueue.main.async {
            self.collectionView.dataSource = self.dataSource
            self.collectionView.delegate = self
            self.collectionView.reloadData()
        }
    }
}

// MARK: CardsViewModelErrorDelegate
extension ViewController : CardsViewModelErrorDelegate {
    
    static let title = "Alert!!"
    static let message = "Data fetch failed"
    
    func failStatus() {
        DispatchQueue.main.async {
            self.showAlert(title:ViewController.title, message: ViewController.message)
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.minimumInterimSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Constant.collectionHeight)
    }
    
}

