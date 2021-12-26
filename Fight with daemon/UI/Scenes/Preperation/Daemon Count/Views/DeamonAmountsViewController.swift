//
//  DeamonAmountsViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/22/21.
//

import UIKit
import Combine

final class DeamonAmountsViewController: UIViewController, Alertable {

    @IBOutlet weak var deamonTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var viewModel: DeamonAmountViewModel!
    private var delegate: GameFlowViewDelegate?
    private var cancellables = Set<AnyCancellable>()
    
    let INVALID_DEMON = "Invalid demons amount, Please enter a valid amount"
    
    convenience init(viewModel: DeamonAmountViewModel, delegate: GameFlowViewDelegate) {
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
    
    public func goToGamePreperationPage() {
        let demons = viewModel.generateDeamons()
        if !demons.isEmpty {
            guard let delegate = delegate else { return }
            delegate.didReceiveDeamons(demons: demons)
        } else {
            showAlert(message: INVALID_DEMON)
        }
    }
}
