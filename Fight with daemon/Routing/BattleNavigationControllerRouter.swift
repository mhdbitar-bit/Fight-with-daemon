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
    
    func selectWeapon(for weapons: [Weapon], completion: @escaping (Weapon) -> Void) {
        show(factory.weaponsViewController(for: weapons, callback: completion))
    }
            
    func fight(for activity: Activity, continueCompletion: @escaping (Result) -> Void, buyWeaponsCompletion: @escaping () -> Void) {
        show(factory.activityViewController(for: activity, continueCallBack: continueCompletion, buyWeaponsCallback: buyWeaponsCompletion))
    }
    
    func didCompleteBattle(withResults results: [Result]) {
        show(factory.resultsViewController(for: results))
    }
    
    func buyWeapons(amount: Int) {
//        let viewModel = WeaponsViewModel(amount: amount)
//        let vc = WeaponsViewController(viewModel: viewModel, delegate: BattlePreperationFlowViewController())
//        navigationController.present(vc, animated: true, completion: nil)
    }
    
    private func show(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
