//
//  Flow.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import Foundation

final class Flow {
    private let delegate: BattleDelegate
    private var game: Game
    private var results: [Result] = []
    
    init(game: Game, delegate: BattleDelegate) {
        self.game = game
        self.delegate = delegate
    }
    
    func start() {
        delegateFightHandling(at: game.demons.startIndex)
    }
    
    private func delegateFightHandling(at index: Int) {
        if index < game.demons.endIndex && !game.weapons.isEmpty {
            let demon = game.demons[index]
            let weapons = game.weapons
            let activity = Activity(weapons: weapons, demon: demon, amount: game.amount)
            delegate.fight(for: activity, continueCompletion: fightResult(at: index), buyWeaponsCompletion: showWeapons())
        } else {
            delegate.didCompleteBattle(withResults: results)
        }
    }
    
    private func delegateFightHandling(after index: Int) {
        delegateFightHandling(at: game.demons.index(after: index))
    }
    
    private func fightResult(at index: Int) -> (Result) -> Void {
        return { [weak self] result in
            guard let self = self else { return }
            if result.state == .Lose {
                self.game.weapons.remove()
            }
            self.results.insert(result, at: index)
            self.delegateFightHandling(after: index)
        }
    }
    
    private func showWeapons() -> (() -> Void){
        return { [weak self] in
            guard let self = self else { return }
            self.delegate.buyWeapons(amount: self.game.amount)
        }
    }
}

private extension Array {
    mutating func remove() {
        removeAll()
    }
}
