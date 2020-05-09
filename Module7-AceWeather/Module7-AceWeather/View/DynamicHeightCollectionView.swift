//
//  DynamicHeightCollectionView.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 09/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    
    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
}
