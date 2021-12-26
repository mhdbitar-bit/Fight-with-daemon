//
//  DemonTableViewCell.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/26/21.
//

import UIKit

final class DemonTableViewCell: UITableViewCell {
    @IBOutlet weak var demonLabel: UILabel!
    
    var demon: Deamon! {
        didSet {
            demonLabel.text = demon.name
        }
    }
}
