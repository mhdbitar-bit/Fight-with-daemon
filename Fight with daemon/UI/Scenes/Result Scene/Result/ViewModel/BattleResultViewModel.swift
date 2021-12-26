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
    private let remaingWeapons: [Weapon]
    
    @Published var killedDemons: [Deamon] = []
    @Published var weapons: [Weapon] = []
    @Published var isFightWon: Bool = false
    
    init(battleResults: [Result], remaingWeapons: [Weapon]) {
        self.battleResults = battleResults
        self.remaingWeapons = remaingWeapons
    }
    
    func getResults() {
        var killedDemons: [Deamon] = []
        var fightWon = 0
        
        for result in battleResults {
            if result.state == .Win {
                fightWon += 1
                killedDemons.append(result.demon)
            }
        }
        
        self.killedDemons = killedDemons
        self.weapons = remaingWeapons
        self.isFightWon = fightWon > (battleResults.count - fightWon)
    }
}
