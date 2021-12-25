//
//  ActivityViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import Foundation

final class ActivityViewModel {
    var weapons: [Weapon]
    var demon: Deamon
    var amount: Int
    
    init(weapons: [Weapon], demon: Deamon, amount: Int) {
        self.weapons = weapons
        self.demon = demon
        self.amount = amount
    }
    
    public func fight() -> Result {
        var state: Result.FightSate = .Lose
        for weapon in weapons {
            if demon.powers.count > 1 {
                state = .Lose
            } else {
                switch (weapon.power, demon.powers.first) {
                case (.Water, .Water), (.Fire, .Water), (.Ice, .Water), (.Fire, .Ice):
                    state = .Win(weapon)
                    break
                default:
                    state = .Lose
                }
            }
        }
        
        return Result(weapons: weapons, demon: demon, state: state)
    }
}
