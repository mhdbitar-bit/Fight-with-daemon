//
//  GamePreperationViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/21/21.
//

import Foundation
import Combine

final class GamePreperationViewModel {
    let title: String = "Game Preperation"
    
    var amount: Int
    var weapons: [Weapon] = [WaterWeapon(),
                                    FireWeapon(),
                                    ThunderWeapon(),
                                    IceWeapon()]
    
    init(amount: Int) {
        self.amount = amount
    }
    
    var selectedWeapons: [Weapon] = []
    
    func setWeapon(index: Int) {
//        if amount > 0 && weapons[index] {
//        }
    }
}
