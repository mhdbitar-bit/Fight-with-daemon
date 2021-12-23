//
//  GameViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/22/21.
//

import UIKit

final class GameViewController: UIViewController {

    private var viewModel: GameViewModel!
    
    convenience init(viewModel: GameViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
