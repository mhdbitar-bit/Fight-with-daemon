//
//  AmountViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import UIKit
import Combine

final class AmountViewController: UIViewController, Alertable {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var viewModel: AmountViewModel!
    private var cancellables = Set<AnyCancellable>()
    var delegate: GameFlowViewDelegate?
    
    let INVALID_AMOUNT = "Invalid amount, Please enter a valid amount"
    
    convenience init(viewModel: AmountViewModel, delegate: GameFlowViewDelegate?) {
        self.init()
        self.viewModel = viewModel
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel.title
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        bindTextField()
        bindValidation()
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        goToGamePreperationPage()
    }
    
    private func bindTextField() {
        amountTextField.textPublisher
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
            delegate?.didReceiveAmount(amount: amount)
        } else {
            showAlert(message: INVALID_AMOUNT)
        }
    }
}
