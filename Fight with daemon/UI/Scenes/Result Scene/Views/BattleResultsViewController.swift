//
//  BattleResultsViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/23/21.
//

import UIKit
import Combine

final class BattleResultsViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var weaponsLabel: UILabel!
    @IBOutlet weak var deamonsLabel: UILabel!
    
    private var viewModel: BattleResultViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
    convenience init(viewModel: BattleResultViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        viewModel.getResults()
        bindViewModel()
    }
    
    private func bindViewModel() {
        bindBattleResult()
        bindKilledDemons()
        bindRemaingWeapons()
    }
    
    private func bindBattleResult() {
        viewModel.$isFightWon.sink { [weak self] result in
            guard let self = self else { return }
            if result {
                self.resultLabel.text = "Congratulations, You won this battle."
                self.resultImage.image = UIImage(systemName: "checkmark.circle.fill")
                self.resultImage.tintColor = .green
            } else {
                self.resultLabel.text = "Bad luck, You lost this battle."
                self.resultImage.image = UIImage(systemName: "xmark.circle.fill")
                self.resultImage.tintColor = .red
            }
        }.store(in: &cancellables)
    }
    
    private func bindKilledDemons() {
        viewModel.$killedDemons.sink { [weak self] demons in
            guard let self = self else { return }
            self.deamonsLabel.text = "Killed demons: \(demons.count)"
        }.store(in: &cancellables)
    }
    
    private func bindRemaingWeapons() {
        viewModel.$weapons.sink { [weak self] weapons in
            guard let self = self else { return }
            self.weaponsLabel.text = "Remaing weapons: \(weapons.count)"
        }.store(in: &cancellables)
    }
    
    @IBAction func repeatBtnTapped(_ sender: UIButton) {
        navigationController?.setViewControllers([BattlePreperationFlowViewController()], animated: false)
    }
    
    @IBAction func showDeamonsBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func showWeaponsBtnTapped(_ sender: UIButton) {
    }
}
