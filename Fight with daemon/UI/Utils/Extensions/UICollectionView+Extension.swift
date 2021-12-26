//
//  UICollectionView+Extension.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/21/21.
//

import UIKit

extension UICollectionView {
    func register(_ type: UICollectionViewCell.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(_ type: T.Type, indexPath: IndexPath) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as? T
    }
    
    func selectCell(at index: Int) -> UICollectionViewCell? {
        self.dataSource?.collectionView(self, cellForItemAt: IndexPath(row: index, section: 0))
    }
}
