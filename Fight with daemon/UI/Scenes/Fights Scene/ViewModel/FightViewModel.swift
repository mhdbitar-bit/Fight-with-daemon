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
        let weaponPowers = weapons.compactMap { $0.power }
        if weaponPowers.hasCommonElements(with: demon.powers) {
            state = .Win
        } else {
            state = .Lose
        }
        
        return Result(weapons: weapons, demon: demon, state: state)
    }
}

private extension Array where Element: Hashable {

    func set() -> Set<Array.Element> {
        return Set(self)
    }
    
    func commonElements(between array: Array) -> Array {
        let intersection = self.set().intersection(array.set())
        return intersection.map({ $0 })
    }

    func hasCommonElements(with array: Array) -> Bool {
        return self.commonElements(between: array).count >= 1 ? true : false
    }
}
