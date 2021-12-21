//
//  ThunderWeapon.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation

final class ThunderWeapon: Weapon {
    
    internal var weapon: WeaponModel?
    
    func createWeapon() -> WeaponModel {
        weapon = WeaponModel(name: "Thunder", price: 3, image: "thunder-gun")
        return weapon!
    }
}
