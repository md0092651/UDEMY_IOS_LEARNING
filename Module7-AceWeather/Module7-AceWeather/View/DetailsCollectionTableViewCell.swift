//
//  DetailsCollectionTableViewCell.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 09/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit

class DetailsCollectionTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView?.register(DetailCollectionViewCell.nib, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        
    }
    var item: [MoreInfoModel] = [] {
        didSet {
            guard (item as? [MoreInfoModel]) != nil else {
                return
            }
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}

extension DetailsCollectionTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let item = item as? [MoreInfoModel], let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as? DetailCollectionViewCell {
            let detail = item[indexPath.row]
            cell.item = detail
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension DetailsCollectionTableViewCell : UICollectionViewDelegateFlowLayout {
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.collectionView.layoutIfNeeded()
        let contentSize = self.collectionView.collectionViewLayout.collectionViewContentSize
        if self.collectionView.numberOfItems(inSection: 0) < 4 {
            return CGSize(width: contentSize.width, height: 100) // Static height if colview is not fitted properly.
        }
        return CGSize(width: contentSize.width, height: contentSize.height + 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = ((UIScreen.main.bounds.width) - 32 - 30 ) / 2
        return CGSize(width: cellWidth, height:50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

