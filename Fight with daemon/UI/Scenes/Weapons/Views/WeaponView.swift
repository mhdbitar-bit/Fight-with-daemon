//
//  WeaponView.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/26/21.
//

import UIKit

final class WeaponView: LoadableFromXibView {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.setRoundedConrerWith(corner: 12, width: 1, color: .black.withAlphaComponent(0.2))
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var weapon: Weapon! {
        didSet {
            powerLabel.text = weapon.name
            priceLabel.text = "Price: \(weapon.price)"
            imageView.image = UIImage(named: weapon.image)
        }
    }
}
