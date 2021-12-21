//
//  FireWeapon.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation

class FireWeapon: WeaponFactory {
    func createWeapon() -> Weapon {
        return Weapon(name: "Fire", price: 1, image: "fire-gun")
    }
}
