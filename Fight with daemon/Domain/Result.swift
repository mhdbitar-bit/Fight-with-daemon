//
//  Result.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import Foundation

public struct Result {
    enum FightSate: Equatable {
        case Win
        case Lose
    }
    let weapon: Weapon
    let demon: Deamon
    let state: FightSate
}
