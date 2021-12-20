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
    
    var viewModel: AmountViewModel!
    
    convenience init(viewModel: AmountViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel.title
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        
    }
}
