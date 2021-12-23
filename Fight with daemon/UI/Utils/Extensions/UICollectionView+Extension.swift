//
//  UICollectionView+Extension.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/21/21.
//

import UIKit

extension UICollectionView {
    func selectCell(at index: Int) -> UICollectionViewCell? {
        self.dataSource?.collectionView(self, cellForItemAt: IndexPath(row: index, section: 0))
    }
}
