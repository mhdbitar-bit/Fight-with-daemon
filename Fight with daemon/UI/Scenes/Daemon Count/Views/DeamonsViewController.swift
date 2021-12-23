//
//  DeamonsViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/22/21.
//

import UIKit
import Combine

final class DeamonsViewController: UIViewController, Alertable {

    @IBOutlet weak var deamonTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var viewModel: DeamonViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    let INVALID_AMOUNT = "Invalid amount, Please enter a valid amount"
    
    convenience init(viewModel: DeamonViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = viewModel.title
        
        bindTextField()
        bindValidation()
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        goToGamePreperationPage()
    }
    
    private func bindTextField() {
        deamonTextField.textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.amount, on: viewModel)
            .store(in: &cancellables)
    }
    
    private func bindValidation() {
        viewModel.isInputValid
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: submitButton)
            .store(in: &cancellables)
    }
    
    private func goToGamePreperationPage() {
//        if let amount = Int(viewModel.amount) {
//            let gameViewModel = GameViewModel(amount: amount, weapons: viewModel.$)
//            let vc = GameViewController(viewModel: gamePreperationViewModel)
//            self.show(vc, sender: self)
//        } else {
//            showAlert(message: INVALID_AMOUNT)
//        }
    }
}
