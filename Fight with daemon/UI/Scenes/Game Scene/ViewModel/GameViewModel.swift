//
//  GameViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/22/21.
//

import Foundation
import Combine

final class GameViewModel {
    let title = "Game"
    var amount: Int = 0
    var deamonsCount: Int = 0
    
    @Published var weapons: [Weapon] = []
    @Published var selectedDeamons: [Deamon] = []
    
    let deamons: [Deamon] = [
        Deamon(name: "Water", powers: [.Water]),
        Deamon(name: "Fire", powers: [.Fire]),
        Deamon(name: "Magnet", powers: [.Magnet]),
        Deamon(name: "Ice", powers: [.Ice]),
        Deamon(name: "Water + Magnet", powers: [.Water, .Magnet]),
        Deamon(name: "Water + Fire + Magnet", powers: [.Water, .Fire, .Magnet])
    ]
    
    func generateDeamons() {
        selectedDeamons = []
        var index = 0
        for _ in 0..<deamonsCount {
            index = Int.random(in: 0..<deamons.count - 1)
            selectedDeamons.append(deamons[index])
        }
    }
}
