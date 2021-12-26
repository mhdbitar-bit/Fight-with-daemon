//
//  WeaponsViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/26/21.
//

import UIKit

final class WeaponsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(WeaponTableViewCell.nib, forCellReuseIdentifier: WeaponTableViewCell.identifier)
    }
}

extension WeaponsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return WeaponTableViewCell()
    }
}
