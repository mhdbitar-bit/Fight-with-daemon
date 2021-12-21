//
//  FireWeapon.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation

final class FireWeapon: Weapon {
    
    internal var weapon: WeaponModel?
    
    func createWeapon() -> WeaponModel {
        weapon = WeaponModel(name: "Fire", price: 1, image: "fire-gun")
        return weapon!
    }
}
