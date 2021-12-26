//
//  DemonView.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/26/21.
//

import UIKit

final class DemonView: LoadableFromXibView {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.setRoundedConrerWith(corner: 12, width: 1, color: .black.withAlphaComponent(0.2))
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var deamon: Deamon! {
        didSet {
            nameLabel.text = deamon.name
        }
    }
}
