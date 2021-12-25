//
//  BattleNavigationControllerRouter.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import UIKit

final class BattleNavigationControllerRouter: BattleDelegate {
    
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func fight(for activity: Activity, completion: @escaping (Result) -> Void) {
        show(factory.activityViewController(for: activity, fightCallBack: completion))
    }
    
    func didCompleteBattle(withResults results: [Result]) {
        show(factory.resultsViewController(for: results))
    }
    
    private func show(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
