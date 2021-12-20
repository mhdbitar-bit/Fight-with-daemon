//
//  AmountViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import UIKit

final class AmountViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Amount"
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        
    }
}
