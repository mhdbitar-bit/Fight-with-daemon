//
//  GameFlowViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/23/21.
//

import UIKit

protocol GameFlowViewDelegate: AnyObject {
    func didReceiveAmount(amount: Int)
    func didReceiveWeapons(weapons: [Weapon], amount: Int)
    func didReceiveDeamons(deamons: Int)
}

final class GameFlowViewController: UIViewController {
    
    private var viewModel: FightViewModel!
    
    convenience init(viewModel: FightViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let amountViewModel = AmountViewModel()
        let vc = AmountViewController(viewModel: amountViewModel, delegate: self)
        show(vc, sender: self)
    }
}

extension GameFlowViewController: GameFlowViewDelegate {
    
    func didReceiveAmount(amount: Int) {
        viewModel.amount = amount
        let weaponsViewModel = WeaponsViewModel(amount: amount)
        let vc = WeaponsViewController(viewModel: weaponsViewModel, delegate: self)
        show(vc, sender: self)
    }
    
    func didReceiveWeapons(weapons: [Weapon], amount: Int) {
        viewModel.weapons = weapons
        viewModel.amount = amount
        let deamonsViewModel = DeamonViewModel()
        let vc = DeamonsViewController(viewModel: deamonsViewModel, delegate: self)
        show(vc, sender: self)
    }
    
    func didReceiveDeamons(deamons: Int) {
        viewModel.deamonsCount = deamons
        let vc = FightsViewController(viewModel: viewModel)
        show(vc, sender: self)
    }
}
