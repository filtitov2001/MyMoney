//
//  Extension + UICollectionViewFlowLayout.swift
//  MyMoney
//
//  Created by Felix Titov on 8/31/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  

import UIKit

extension UICollectionViewFlowLayout {
    
    convenience init(scrollDirection: UICollectionView.ScrollDirection) {
        self.init()
        self.scrollDirection = scrollDirection
    }
}
