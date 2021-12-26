//
//  FightViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import Foundation

final class FightViewModel {
    var weapon: Weapon
    var demon: Deamon
    var amount: Int
    
    init(weapon: Weapon, demon: Deamon, amount: Int) {
        self.weapon = weapon
        self.demon = demon
        self.amount = amount
    }
    
    public func fight() -> Result {
        var state: Result.FightSate = .Lose
        if demon.powers.count > 1 {
            state = .Lose
        } else {
            switch (weapon.power, demon.powers.first) {
            case (.Water, .Water), (.Fire, .Fire), (.Ice, .Ice), (.Water, .Fire), (.Ice, .Water), (.Fire, .Ice):
                state = .Win
            default:
                state = .Lose
            }
        }
        
        return Result(weapon: weapon, demon: demon, state: state)
    }
}
