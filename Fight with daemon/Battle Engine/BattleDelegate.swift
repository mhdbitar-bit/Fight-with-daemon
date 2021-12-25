//
//  BattleDelegate.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import Foundation

public struct Game {
    var weapons: [Weapon]
    let demons: [Deamon]
    let amount: Int
}

public struct Result {
    enum FightSate: Equatable {
        case Win(Weapon)
        case Lose
    }
    let weapons: [Weapon]
    let demon: Deamon
    let state: FightSate
}

public struct Activity: Equatable {
    let weapons: [Weapon]
    let demon: Deamon
    let amount: Int
}

public protocol BattleDelegate {
    func fight(for activity: Activity, completion: @escaping (Result) -> Void)
    
    func didCompleteBattle(withResults results: [Result])
}
