//
//  DeamonViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/22/21.
//

import Foundation
import Combine

final class DeamonViewModel {
    let title: String = "Deamon Amount"
    @Published var amount: String = ""
    
    private let demons: [Deamon] = [
        Deamon(name: "Water", powers: [.Water]),
        Deamon(name: "Fire", powers: [.Fire]),
        Deamon(name: "Magnet", powers: [.Magnet]),
        Deamon(name: "Ice", powers: [.Ice]),
        Deamon(name: "Water + Magnet", powers: [.Water, .Magnet]),
        Deamon(name: "Water + Fire + Magnet", powers: [.Water, .Fire, .Magnet])
    ]
    
    private(set) lazy var isInputValid = $amount
        .map { !$0.isEmpty && $0 != "0" }
        .eraseToAnyPublisher()
    
    public func generateDeamons() -> [Deamon] {
        guard let amountInt = Int(amount) else { return [] }
        var selectedDemons: [Deamon] = []
        var index = 0
        for _ in 0..<Int(amountInt) {
            index = Int.random(in: 0..<demons.count - 1)
            selectedDemons.append(demons[index])
        }
        
        return selectedDemons
    }
}
