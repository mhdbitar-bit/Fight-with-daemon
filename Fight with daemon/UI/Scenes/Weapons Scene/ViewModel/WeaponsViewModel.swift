//
//  WeaponsViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/21/21.
//

import Foundation
import Combine

final class WeaponsViewModel {
    
    let title: String = "Game Preperation"
    
    @Published var amount: Int
    @Published var weapons: [Weapon] = []
    @Published var selectedWeapons: [Weapon] = []
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func fetchWeapons() {
        weapons = [
            Weapon(name: "Water", price: 2, image: "water-gun", power: .Water),
            Weapon(name: "Magnet", price: 3, image: "magnet-gun", power: .Magnet),
            Weapon(name: "Fire", price: 1, image: "fire-gun", power: .Fire),
            Weapon(name: "Ice", price: 5, image: "ice-gun", power: .Ice)
        ]
    }
    
    func selectWeapon(at index: Int) {
        if amount > 0 && weapons[index].price <= amount {
            selectedWeapons.append(weapons[index])
            amount -= weapons[index].price
        }
    }
    
    func removeWeapon(at index: Int) {
        guard let selectedWeaponIndex = getWeaponIndex(selectedWeapon: weapons[index]) else { return }
        selectedWeapons.remove(at: selectedWeaponIndex)
        amount += weapons[index].price
    }
    
    private func getWeaponIndex(selectedWeapon: Weapon) -> Int? {
        return selectedWeapons.firstIndex(where: { $0.name == selectedWeapon.name })
    }
}
