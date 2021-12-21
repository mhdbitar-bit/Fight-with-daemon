//
//  UICollectionView+Extension.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/21/21.
//

import UIKit

extension UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
