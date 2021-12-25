//
//  BattleResultViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import Foundation
import Combine

final class BattleResultViewModel {
    private let battleResults: [Result]
    
    
    init(battleResults: [Result]) {
        self.battleResults = battleResults
    }
    
    func getResults() -> (result: Bool, killedDemons: [Deamon], weapons: [Weapon]) {
        var killedDemons: [Deamon] = []
        var weapons: [Weapon] = []
        var fightWon = 0
        for result in battleResults {
//            if result.state == .Win {
//                fightWon += 1
//                killedDemons.append(result.demon)
//            }
//            weapons.append(result.)
        }
        
        let result = fightWon > (battleResults.count - fightWon)
        return (result: result, killedDemons: killedDemons, weapons: weapons)
    }
}
