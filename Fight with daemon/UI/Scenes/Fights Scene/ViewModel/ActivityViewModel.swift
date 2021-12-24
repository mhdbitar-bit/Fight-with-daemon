//
//  ActivityViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import Foundation

final class ActivityViewModel {
    var deamon: Deamon
    var weapons: [Weapon]

    init(deamon: Deamon, weapons: [Weapon]) {
        self.deamon = deamon
        self.weapons = weapons
    }
}
