//
//  WeaponCollectionViewCell.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/21/21.
//

import UIKit

class WeaponCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.setRoundedConrerWith(corner: 12, width: 1, color: .black.withAlphaComponent(0.2))
        }
    }
    @IBOutlet weak var weaponImage: UIImageView!
    @IBOutlet weak var weaponNameLabel: UILabel!
    @IBOutlet weak var weaponPriceLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var removeBtn: UIButton!
    
    func configure(weapon: Weapon, with actions: Bool = true) {
        weaponNameLabel.text = weapon.name
        weaponPriceLabel.text = "Price: \(weapon.price)"
        weaponImage.image = UIImage(named: weapon.image)
        addBtn.isHidden = !actions
        removeBtn.isHidden = !actions
    }
}
