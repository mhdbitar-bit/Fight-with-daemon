//
//  BattleDelegate.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import Foundation

public protocol BattleDelegate {
    func selectWeapon(for weapons: [Weapon], completion: @escaping ([Weapon]) -> Void)
    func fight(for activity: Activity, continueCompletion: @escaping (Result) -> Void, buyWeaponsCompletion: @escaping () -> Void)
    func didCompleteBattle(withResults results: [Result], remaingWeapons: [Weapon], weaponsCallback: @escaping (() -> Void), demonsCallback: @escaping (([Deamon]) -> Void))
    func showReamaingWeapons(for weapons: [Weapon])
    func showKilledDemons(for demons: [Deamon])
    func buyWeapons(amount: Int, callback: @escaping (([Weapon], Int) -> Void))
}
