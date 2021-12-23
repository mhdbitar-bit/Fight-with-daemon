//
//  UIView+Extension.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/21/21.
//

import UIKit

extension UIView {
    
    public func setRoundedConrerWith(corner: CGFloat, width: CGFloat, color: UIColor) {
        layer.cornerRadius = corner
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
