//
//  IceWeapon.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation

final class IceWeapon: Weapon {
    
    internal var weapon: WeaponModel?
    
    func createWeapon() -> WeaponModel {
        weapon = WeaponModel(name: "Ice", price: 5, image: "ice-gun")
        return weapon!
    }
}
