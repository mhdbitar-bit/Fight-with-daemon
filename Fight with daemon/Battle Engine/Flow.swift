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
            delegate.selectWeapon(for: game.weapons, completion: startFighiting(index))
        } else {
            delegate.didCompleteBattle(withResults: results, remaingWeapons: game.weapons) { [weak self] in
                guard let self = self else { return }
                self.delegate.showReamaingWeapons(for: self.game.weapons)
            }
        }
    }
    
    private func startFighiting(_ index: Int) -> (Weapon) -> Void {
        return { [weak self] weapon in
            guard let self = self else { return }
            let game = self.game
            let demon = game.demons[index]
            let amount = game.amount
            let activity = Activity(weapon: weapon, demon: demon, amount: amount)
            self.delegate.fight(
                for: activity,
                continueCompletion: self.fightResult(at: index),
                buyWeaponsCompletion: self.showWeapons()
            )
        }
    }
    
    private func delegateFightHandling(after index: Int) {
        delegateFightHandling(at: game.demons.index(after: index))
    }
    
    private func fightResult(at index: Int) -> (Result) -> Void {
        return { [weak self] result in
            guard let self = self else { return }
            self.results.insert(result, at: index)
            if result.state == .Lose {
                self.game.weapons = self.game.weapons.filter { $0 != result.weapon }
                self.delegateFightHandling(at: index)
            } else {
                self.delegateFightHandling(after: index)
            }
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
