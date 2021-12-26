//
//  FightViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import UIKit

final class FightViewController: UIViewController, Alertable, Lodable {
    
    @IBOutlet weak var weaponView: WeaponView!
    @IBOutlet weak var demonView: DemonView!
        
    private var viewModel: FightViewModel!
    private var continueAction: ((Result) -> Void)? = nil
    private var buyWeaponsAction: (() -> Void)? = nil
    var activityIndicator = UIActivityIndicatorView()
    
    private let padding: CGFloat = 20
    private let headerID = "Header"
    
    convenience init(viewModel: FightViewModel, continueAction: @escaping (Result) -> Void, buyWeaponsAction: @escaping (() -> Void)) {
        self.init()
        self.viewModel = viewModel
        self.continueAction = continueAction
        self.buyWeaponsAction = buyWeaponsAction
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fight"
        self.navigationItem.setHidesBackButton(true, animated: false)
        weaponView.weapon = viewModel.weapon
        demonView.deamon = viewModel.demon
    }
        
    @IBAction func actionBtnTapped(_ sender: UIButton) {
        let fightResult = viewModel.fight()
        if fightResult.state == .Lose && viewModel.amount > 0 {
            displayBuyWeaponsSheet(fightResult)
        } else {
            continueToNextFight(result: fightResult)
        }
    }
}

extension FightViewController {
    private func continueBattle(_ fightResult: Result) {
        continueAction?(fightResult)
    }
    
    private func displayWeapons() {
        buyWeaponsAction?()
    }
    
    private func continueToNextFight(result: Result) {
        self.showSpinner()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            self.hideSpinner()
            var message = ""
            if result.state == .Lose {
                message = "You lost this fight"
            } else {
                message = "You Won this fight"
            }
            self.showActionsheet(title: "Info", message: message, actions: [
                ("Continue", .default),
                ("Exit Game", .destructive)
            ]) { [weak self] index in
                guard let self = self else { return }
                if index == 0 {
                    self.continueBattle(result)
                } else {
                    self.displayWeapons()
//                    self.navigationController?.setViewControllers([BattlePreperationFlowViewController()], animated: false)
                }
            }
        }
    }
    
    private func displayBuyWeaponsSheet(_ fightResult: Result) {
        self.showSpinner()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            self.hideSpinner()
            self.showActionsheet(title: "Info", message: "You Lost this fight, and looks you have some \(self.viewModel.amount) amounts, do you want to buy some weapons?", actions: [
                ("Get new Weapons", .default),
                ("Continue", .cancel)
            ]) { [weak self] index in
                guard let self = self else { return }
                if index == 0 {
                    self.displayWeapons()
                } else {
                    self.continueBattle(fightResult)
                }
            }
        }
    }
}
