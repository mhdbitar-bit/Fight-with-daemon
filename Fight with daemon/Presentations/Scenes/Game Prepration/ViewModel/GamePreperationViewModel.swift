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
    var weapons: [Weapon] = [
        WaterWeapon(),
        FireWeapon(),
        ThunderWeapon(),
        IceWeapon()
    ]
    
    private var selectedWeapons: [Weapon] = []
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func selectWeapon(at index: Int) {
        if amount > 0 && weapons[index].getPrice() <= amount {
            selectedWeapons.append(weapons[index])
            amount -= weapons[index].getPrice()
        }
    }
    
    func removeWeapon(at index: Int) {
        guard let selectedWeaponIndex = getWeaponIndex(selectedWeapon: weapons[index]) else { return }
        selectedWeapons.remove(at: selectedWeaponIndex)
    }
    
    private func getWeaponIndex(selectedWeapon: Weapon) -> Int? {
        return selectedWeapons.firstIndex(where: { $0.getName() == selectedWeapon.getName() })
    }
}
