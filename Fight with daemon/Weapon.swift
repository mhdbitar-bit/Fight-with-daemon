//
//  Weapon.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation

protocol Weapon {
    var weapon: WeaponModel? { get set }
    
    func createWeapon() -> WeaponModel
    func getPrice() -> Int
}

extension Weapon {
    func getPrice() -> Int {
        guard let weapon = weapon else { return 0}
        return weapon.price
    }
}
