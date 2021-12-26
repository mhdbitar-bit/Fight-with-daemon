//
//  Activity.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import Foundation

public struct Activity: Equatable {
    let weapons: [Weapon]
    let demon: Deamon
    let amount: Int
}
