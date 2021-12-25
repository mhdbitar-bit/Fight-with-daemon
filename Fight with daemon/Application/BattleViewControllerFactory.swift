//
//  BattleViewControllerFactory.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import UIKit

final class BattleViewControllerFactory: ViewControllerFactory {
    private let weapons: [Weapon]
    private let demons: [Deamon]
    private let amount: Int
    
    init(weapons: [Weapon], demons: [Deamon], amount: Int) {
        self.weapons = weapons
        self.demons = demons
        self.amount = amount
    }
    
    func activityViewController(for activity: Activity, fightCallBack: @escaping (Result) -> Void) -> UIViewController {
        let viewModel = ActivityViewModel(weapons: activity.weapons, demon: activity.demon, amount: activity.amount)
        let vc = ActivityViewController(viewModel: viewModel, action: fightCallBack)
        return vc
    }
    
    func resultsViewController(for results: [Result]) -> UIViewController {
        let viewModel = BattleResultViewModel(battleResults: results)
        let vc = BattleResultsViewController(viewModel: viewModel)
        return vc
    }
}
