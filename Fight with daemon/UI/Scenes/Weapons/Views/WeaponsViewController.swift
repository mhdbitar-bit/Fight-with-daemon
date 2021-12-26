//
//  WeaponsViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/26/21.
//

import UIKit

final class WeaponsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private(set) var weapons = [Weapon]()
    private var selection: ((Weapon) -> Void)? = nil
    
    convenience init(weapons: [Weapon], selection: @escaping ((Weapon) -> Void)) {
        self.init()
        self.weapons = weapons
        self.selection = selection
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Weapons"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(WeaponTableViewCell.self)
    }
}

extension WeaponsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weapons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(WeaponTableViewCell.self) else { return UITableViewCell() }
        cell.weapon = weapons[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(weapons[indexPath.row])
    }
}
