//
//  ResultViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/23/21.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var weaponsLabel: UILabel!
    @IBOutlet weak var deamonsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showDeamonsBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func showWeaponsBtnTapped(_ sender: UIButton) {
    }
}
