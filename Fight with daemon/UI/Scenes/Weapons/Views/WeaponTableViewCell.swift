//
//  WeaponTableViewCell.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/26/21.
//

import UIKit

class WeaponTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weaponImage: UIImageView!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var weapon: Weapon! {
        didSet {
            powerLabel.text = weapon.name
            powerLabel.text = "Price: \(weapon.price)"
            weaponImage.image = UIImage(named: weapon.image)
        }
    }
}
