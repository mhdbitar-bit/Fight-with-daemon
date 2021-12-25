//
//  ResultPresenter.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import Foundation

final class ResultPresenter {
    private let weapons: [Weapon]
    private let demons: [Deamon]
    
    init(weapons: [Weapon], demons: [Deamon]) {
        self.weapons = weapons
        self.demons = demons
    }
    
    var title: String {
        return "Result"
    }
}
