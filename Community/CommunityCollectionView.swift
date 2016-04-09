//
//  CommunityCollectionView.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 09/04/16.
//
//

import Foundation
import UIKit

class CommunityCollectionView: UICollectionView  {
    
    let collectionIdentifierCell = "Cell"

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: frame, collectionViewLayout: layout)
        let _itemSize = CGSizeMake(UIScreen.mainScreen().bounds.width/4, 70)
        let _layout   = UICollectionViewFlowLayout.init()
        
        _layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 0)
        _layout.minimumInteritemSpacing = 0
        _layout.minimumLineSpacing = 0
        
        _layout.scrollDirection = .Horizontal
        _layout.itemSize = _itemSize
        
        self.showsHorizontalScrollIndicator = false
        self.frame = frame
        self.collectionViewLayout = _layout
        self.backgroundColor = UIColor.clearColor()
        self.registerClass(CommunityCollectionCell.self, forCellWithReuseIdentifier: collectionIdentifierCell)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}