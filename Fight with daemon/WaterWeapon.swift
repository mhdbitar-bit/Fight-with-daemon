//
//  WaterWeapon.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation

final class WaterWeapon: Weapon {
    
    internal var weapon: WeaponModel?
    
    func createWeapon() -> WeaponModel {
        weapon = WeaponModel(name: "Water", price: 2, image: "water-gun")
        return weapon!
    }
}
