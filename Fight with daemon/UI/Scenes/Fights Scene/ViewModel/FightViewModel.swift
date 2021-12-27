//
//  FightViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import Foundation

final class FightViewModel {
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
        let weaponPowers = NSSet(array: weapons.compactMap { $0.power })
        let demonPowers = NSSet(array: demon.powers)
        
        
        if weaponPowers == demonPowers {
            state = .Win
        } else if weaponPowers.isSubset(of: demonPowers as! Set<AnyHashable>) {
            state = .Win
        } else if demonPowers.isSubset(of: weaponPowers as! Set<AnyHashable>) {
            state = .Win
        } else {
            state = .Lose
        }
        
        return Result(weapons: weapons, demon: demon, state: state)
    }
}
