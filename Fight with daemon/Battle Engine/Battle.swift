//
//  Battle.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import Foundation

public final class Battle {
    private let flow: Any
    
    private init(flow: Any) {
        self.flow = flow
    }
    
    public static func start(game: Game, delegate: BattleDelegate) -> Battle {
        let flow = Flow(game: game, delegate: delegate)
        flow.start()
        return Battle(flow: flow)
    }
}
