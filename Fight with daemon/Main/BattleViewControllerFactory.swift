//
//  BattleViewControllerFactory.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import UIKit

final class BattleViewControllerFactory: ViewControllerFactory {
    
    func weaponsViewController(for weapons: [Weapon], callback: @escaping (Weapon) -> Void) -> UIViewController {
        let vc = WeaponsViewController(weapons: weapons, selection: callback)
        return vc
    }
    
    func activityViewController(for activity: Activity, continueCallBack: @escaping (Result) -> Void, buyWeaponsCallback: @escaping () -> Void ) -> UIViewController {
        let viewModel = FightViewModel(weapon: activity.weapon, demon: activity.demon, amount: activity.amount)
        let vc = FightViewController(viewModel: viewModel, continueAction: continueCallBack, buyWeaponsAction: buyWeaponsCallback)
        return vc
    }
    
    func resultsViewController(for results: [Result], remaingWeapons: [Weapon], callback: @escaping () -> Void) -> UIViewController {
        let viewModel = BattleResultViewModel(battleResults: results, remaingWeapons: remaingWeapons)
        let vc = BattleResultsViewController(viewModel: viewModel, callback: callback)
        return vc
    }
}
