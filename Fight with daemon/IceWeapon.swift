//
//  IceWeapon.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation

class IceWeapon: WeaponFactory {
    
    func createWeapon() -> Weapon {
        return Weapon(name: "Ice", price: 5, image: "ice-gun")
    }
}
