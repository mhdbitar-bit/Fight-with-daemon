//
//  DemonsViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/26/21.
//

import UIKit

final class DemonsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private(set) var demons = [Deamon]()
    
    convenience init(demons: [Deamon]) {
        self.init()
        self.demons = demons
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Killed Demons"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(DemonTableViewCell.self)
    }
}

extension DemonsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(DemonTableViewCell.self) else { return UITableViewCell() }
        cell.demon = demons[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
