//
//  BattleViewControllerFactory.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import UIKit

final class BattleViewControllerFactory: ViewControllerFactory {
    
    func activityViewController(for activity: Activity, continueCallBack: @escaping (Result) -> Void, buyWeaponsCallback: @escaping () -> Void ) -> UIViewController {
        let viewModel = ActivityViewModel(weapons: activity.weapons, demon: activity.demon, amount: activity.amount)
        let vc = ActivityViewController(viewModel: viewModel, continueAction: continueCallBack, buyWeaponsAction: buyWeaponsCallback)
        return vc
    }
    
    func resultsViewController(for results: [Result]) -> UIViewController {
        let viewModel = BattleResultViewModel(battleResults: results)
        let vc = BattleResultsViewController(viewModel: viewModel)
        return vc
    }
}
