//
//  BattlePreperationFlowViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/23/21.
//

import UIKit

protocol GameFlowViewDelegate: AnyObject {
    func didReceiveAmount(amount: Int)
    func didReceiveWeapons(weapons: [Weapon], remainingAmount: Int)
    func didReceiveDeamons(demons: [Deamon])
}

final class BattlePreperationFlowViewController: UIViewController {
    
    var battle: Battle?
    
    var amount: Int = 0
    var weapons: [Weapon] = []
    var demons: [Deamon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let amountViewModel = AmountViewModel()
        let vc = AmountViewController(viewModel: amountViewModel, delegate: self)
        show(vc, sender: self)
    }
}

extension BattlePreperationFlowViewController: GameFlowViewDelegate {
    
    func didReceiveAmount(amount: Int) {
        self.amount = amount
        let weaponsViewModel = BuyWeaponsViewModel(amount: amount)
        let vc = BuyWeaponsViewController(viewModel: weaponsViewModel, delegate: self)
        show(vc, sender: self)
    }
    
    func didReceiveWeapons(weapons: [Weapon], remainingAmount: Int) {
        self.amount = remainingAmount
        self.weapons = weapons
        let deamonsViewModel = DeamonViewModel()
        let vc = DeamonsViewController(viewModel: deamonsViewModel, delegate: self)
        show(vc, sender: self)
    }
    
    func didReceiveDeamons(demons: [Deamon]) {
        self.demons = demons
        let factory = BattleViewControllerFactory()
        let router = BattleNavigationControllerRouter(navigationController: navigationController ?? UINavigationController(), factory: factory)
        let game = Game(weapons: weapons, demons: demons, amount: amount)
        battle = Battle.start(game: game, delegate: router)
    }
}
