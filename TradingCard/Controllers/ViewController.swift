//
//  ViewController.swift
//  TradingCard
//
//  Created by Nagesh Kumar Mishra on 31/05/21.
//

import UIKit

class ViewController: UICollectionViewController {
    
    private var cardsViewModel : CardsViewModel!
    private var dataSource : CollectionViewDataSource<DataCollectionViewCell,Cards>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        self.cardsViewModel =  CardsViewModel()       
        self.cardsViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = CollectionViewDataSource(cellIdentifier: "reuseIdentifier", items: self.cardsViewModel.dataFeed?.cards, configureCell: { (cell, data) in
            cell.card = data
        })
        
        DispatchQueue.main.async {
            self.collectionView.dataSource = self.dataSource
            self.collectionView.delegate = self
            self.collectionView.reloadData()
        }
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 141.0)
    }
    
}

