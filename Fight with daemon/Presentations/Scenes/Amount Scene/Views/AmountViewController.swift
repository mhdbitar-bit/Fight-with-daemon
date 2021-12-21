//
//  AmountViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import UIKit
import Combine

final class AmountViewController: UIViewController, Alertable, Lodable {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var viewModel: AmountViewModel!
    private var bindings = Set<AnyCancellable>()
    var activityIndicator = UIActivityIndicatorView()
    
    let INVALID_AMOUNT = "Invalid amount, Please enter a valid amount"
    
    convenience init(viewModel: AmountViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel.title
        
        amountTextField.textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.amount, on: viewModel)
            .store(in: &bindings)
        
        viewModel.isInputValid
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: submitButton)
            .store(in: &bindings)
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        goToGamePreperationPage()
    }
    
    private func goToGamePreperationPage() {
        if let amount = Int(viewModel.amount) {
            let gamePreperationViewModel = GamePreperationViewModel(amount: amount)
            let vc = GamePreprationViewController(viewModel: gamePreperationViewModel)
            self.show(vc, sender: self)
        } else {
            showAlert(message: INVALID_AMOUNT)
        }
    }
}
