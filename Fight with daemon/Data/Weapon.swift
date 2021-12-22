//
//  Weapon.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation

enum WeaponPowers {
    case Water
    case Fire
    case Ice
    case Thunder
}

public struct Weapon: Equatable {
    let name: String
    let price: Int
    let image: String
    let power: WeaponPowers
}
