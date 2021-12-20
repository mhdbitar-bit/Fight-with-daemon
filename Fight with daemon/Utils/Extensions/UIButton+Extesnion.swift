//
//  UIButton+Extesnion.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation
import UIKit

extension UIButton {
    
    var isValid: Bool {
        get { isEnabled }
        set {
            backgroundColor = newValue ? .clear : .lightText
            setTitleColor(.white, for: .normal)
            isEnabled = newValue
        }
    }
}
