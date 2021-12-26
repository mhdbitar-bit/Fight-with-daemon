//
//  BattleDelegate.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import Foundation

public protocol BattleDelegate {
    func selectWeapon(for weapons: [Weapon], completion: @escaping (Weapon) -> Void)
    func fight(for activity: Activity, continueCompletion: @escaping (Result) -> Void, buyWeaponsCompletion: @escaping () -> Void)
    func didCompleteBattle(withResults results: [Result], remaingWeapons: [Weapon])
    func buyWeapons(amount: Int)
}
