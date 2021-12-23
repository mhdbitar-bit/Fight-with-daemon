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
    private var delegate: GameFlowViewDelegate?
    private var cancellables = Set<AnyCancellable>()
    
    let INVALID_AMOUNT = "Invalid amount, Please enter a valid amount"
    
    convenience init(viewModel: DeamonViewModel, delegate: GameFlowViewDelegate) {
        self.init()
        self.viewModel = viewModel
        self.delegate = delegate
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
        if let amount = Int(viewModel.amount) {
            guard let delegate = delegate else { return }
            delegate.didReceiveDeamons(deamons: amount)
        } else {
            showAlert(message: INVALID_AMOUNT)
        }
    }
}
