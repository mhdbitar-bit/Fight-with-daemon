//
//  GameFlowViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/23/21.
//

import UIKit

protocol GameFlowViewDelegate: AnyObject {
    func didReceiveAmount(amount: Int)
    func didReceiveWeapons(weapons: [Weapon])
    func didReceiveDeamons(deamons: Int)
}

final class GameFlowViewController: UIViewController {
    
    private var viewModel: GameViewModel!
    
    convenience init(viewModel: GameViewModel) {
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
        let weaponsViewModel = GamePreperationViewModel(amount: amount)
        let vc = GamePreprationViewController(viewModel: weaponsViewModel)
        show(vc, sender: self)
    }
    
    func didReceiveWeapons(weapons: [Weapon]) {
        viewModel.weapons = weapons
        let deamonsViewModel = DeamonViewModel()
        let vc = DeamonsViewController(viewModel: deamonsViewModel)
        show(vc, sender: self)
    }
    
    func didReceiveDeamons(deamons: Int) {
        viewModel.deamonsCount = deamons
        print("Man: \(viewModel.amount)")
        print("Man: \(viewModel.weapons)")
        print("Man: \(viewModel.deamonsCount)")
    }
}
