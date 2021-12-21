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
    
    var viewModel: AmountViewModel!
    var activityIndicator = UIActivityIndicatorView()
    
    
    convenience init(viewModel: AmountViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel.title
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        let gamePreperationViewModel = GamePreperationViewModel(amount: 0)
        let vc = GamePreprationViewController(viewModel: gamePreperationViewModel)
        self.show(vc, sender: self)
    }
}
