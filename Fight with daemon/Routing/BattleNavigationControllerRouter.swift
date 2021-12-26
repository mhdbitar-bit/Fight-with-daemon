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
    
    func selectWeapon(for weapons: [Weapon], completion: @escaping ([Weapon]) -> Void) {
        show(factory.weaponsViewController(for: weapons, callback: completion))
    }
            
    func fight(for activity: Activity, continueCompletion: @escaping (Result) -> Void, buyWeaponsCompletion: @escaping () -> Void) {
        show(factory.activityViewController(for: activity, continueCallBack: continueCompletion, buyWeaponsCallback: buyWeaponsCompletion))
    }
    
    func didCompleteBattle(withResults results: [Result], remaingWeapons: [Weapon], weaponsCallback: @escaping (() -> Void), demonsCallback: @escaping (([Deamon]) -> Void)) {
        show(factory.resultsViewController(for: results,
                                              remaingWeapons: remaingWeapons,
                                              weaponsCallback: weaponsCallback,
                                              demonsCallback: demonsCallback))
    }
    
    func showReamaingWeapons(for weapons: [Weapon]) {
        present(factory.weaponsViewController(for: weapons, callback: { _ in }))
    }
    
    func showKilledDemons(for demons: [Deamon]) {
        present(factory.demonsviewController(for: demons))
    }
    
    func buyWeapons(amount: Int, callback: @escaping (([Weapon], Int) -> Void)) {
        let viewModel = BuyWeaponsViewModel(amount: amount)
        present(factory.buyWeaponsViewController(for: viewModel, callback: callback))
    }
    
    private func show(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func present(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
