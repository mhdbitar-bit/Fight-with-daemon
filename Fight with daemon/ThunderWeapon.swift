//
//  ThunderWeapon.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation

class ThunderWeapon: WeaponFactory {
    
    func createWeapon() -> Weapon {
        return Weapon(price: 3)
    }
}
