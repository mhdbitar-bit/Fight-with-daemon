//
//  BattleResultsViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/23/21.
//

import UIKit

final class BattleResultsViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var weaponsLabel: UILabel!
    @IBOutlet weak var deamonsLabel: UILabel!
    
    private var viewModel: BattleResultViewModel!
    
    convenience init(viewModel: BattleResultViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        displayResult()
    }
    
    private func displayResult() {
        let (result, killedDemons, _) = viewModel.getResults()
        if result {
            resultLabel.text = "Congratulations, You won this battle."
            resultImage.image = UIImage(systemName: "checkmark.circle.fill")
            resultImage.tintColor = .green
        } else {
            resultLabel.text = "Bad luck, You lost this battle."
            resultImage.image = UIImage(systemName: "xmark.circle.fill")
            resultImage.tintColor = .red
        }
        
        deamonsLabel.text = "Killed demons: \(killedDemons.count)"
    }
    
    @IBAction func repeatBtnTapped(_ sender: UIButton) {
        navigationController?.setViewControllers([BattlePreperationFlowViewController()], animated: false)
    }
    
    @IBAction func showDeamonsBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func showWeaponsBtnTapped(_ sender: UIButton) {
    }
}
