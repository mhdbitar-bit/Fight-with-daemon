//
//  DeamonCollectionViewCell.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/23/21.
//

import UIKit

final class DeamonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var demonView: DemonView!
    
    var deamon: Deamon! {
        didSet {
            demonView.deamon = deamon
        }
    }
}
