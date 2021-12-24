//
//  FightViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import Foundation
import Combine

final class FightViewModel {
    @Published var weapons: [Weapon] = []
    @Published var selectedDeamons: [Deamon] = []
    @Published var fightResult: Bool? = nil
    @Published var battleState: Battle = .fighting
    @Published  var currentFight: Int = 0
    var amount: Int = 0
    
    enum Battle {
        case finished
        case fighting
        case next
    }
    
    
    var deamonsCount: Int = 0
    
    
    private let deamons: [Deamon] = [
        Deamon(name: "Water", powers: [.Water]),
        Deamon(name: "Fire", powers: [.Fire]),
        Deamon(name: "Magnet", powers: [.Magnet]),
        Deamon(name: "Ice", powers: [.Ice]),
        Deamon(name: "Water + Magnet", powers: [.Water, .Magnet]),
        Deamon(name: "Water + Fire + Magnet", powers: [.Water, .Fire, .Magnet])
    ]
    
    public func generateDeamons() {
        selectedDeamons = []
        var index = 0
        for _ in 0..<deamonsCount {
            index = Int.random(in: 0..<deamons.count - 1)
            selectedDeamons.append(deamons[index])
        }
    }
    
    public func fight() {
        battleState = .fighting
        let deamon = selectedDeamons[currentFight]
        var weaponWin = 0
        var weaponLose = 0
        for weapon in weapons {
            if deamon.powers.count > 1 {
                weaponLose += 1
            } else {
                switch (weapon.power, deamon.powers.first) {
                case (.Water, .Water):
                    weaponWin += 1
                case (.Fire, .Water):
                    weaponWin += 1
                case (.Ice, .Water):
                    weaponWin += 1
                default:
                    weaponLose += 1
                }
            }
        }
        
        if weaponWin > weaponLose {
            fightResult = true
            battleState = .next
        } else {
            if amount > 0 {
                battleState = .next
            } else {
                battleState = .finished
            }
            fightResult = false
        }
    }
    
    public func nextFight() {
        currentFight += 1
    }
    
    public func exitGame() {
        selectedDeamons = []
    }
}
