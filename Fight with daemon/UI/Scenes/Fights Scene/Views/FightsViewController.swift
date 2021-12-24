//
//  FightsViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import UIKit
import Combine

final class FightsViewController: UIViewController, Alertable {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var actionButton: UIButton!
    
    private var viewModel: FightViewModel!
    private let pageViewController = FightPagerViewController()
    private var cancellable = Set<AnyCancellable>()
    
    convenience init(viewModel: FightViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.generateDeamons()
        setupPagee()
        bindViewModel()
    }
    
    private func setupPagee() {
        addChild(pageViewController)
        pageViewController.view.frame = contentView.bounds
        contentView.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    private func makeActivityViewController(index: Int)-> ActivityViewController {
        let viewModel = ActivityViewModel(deamon: viewModel.selectedDeamons[index], weapons: viewModel.weapons)
        return ActivityViewController(viewModel: viewModel)
    }
    
    private func bindViewModel() {
        bindCurrentFightIndex()
        bindFightResultMessage()
        bindBattleState()
    }
    
    private func bindCurrentFightIndex() {
        viewModel.$currentFight.sink { [weak self] index in
            guard let self = self else { return }
            self.pageViewController.loadFightes(viewController: self.makeActivityViewController(index: index))
        }.store(in: &cancellable)
    }
    
    private func bindFightResultMessage() {
        viewModel.$fightResult.sink { [weak self] result in
            guard let self = self,
                  let result = result else { return }
            var message = "You were killed by this demon, unfortunately, you can't continue to fight the next demon."
            if result {
                message = "You killed this demon, let's continue to fight the next demon."
            }
            self.showAlert(message: message)
        }.store(in: &cancellable)
    }
    
    private func bindBattleState() {
        viewModel.$battleState.sink { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .fighting:
                self.actionButton.setTitle("Fight", for: .normal)
            case .finished:
                self.actionButton.setTitle("Result", for: .normal)
            case .next:
                self.actionButton.setTitle("Next", for: .normal)
            }
        }.store(in: &cancellable)
    }
    
    private func showResult() {
        viewModel.exitGame()
        let vc = ResultViewController()
        showDetailViewController(vc, sender: self)
    }
    
    @IBAction func fightBtnTapped(_ sender: UIButton) {
        switch viewModel.battleState {
        case .fighting:
            viewModel.fight()
        case .finished:
            showResult()
        case .next:
            viewModel.nextFight()
        }
    }
}
