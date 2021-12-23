//
//  GameViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/22/21.
//

import UIKit
import Combine

class GameViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: GameViewModel!
    private var delegate: GameFlowViewDelegate?
    private var cancellables: Set<AnyCancellable> = []
    private let padding: CGFloat = 20
    
    convenience init(viewModel: GameViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.generateDeamons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DeamonCollectionViewCell.nib, forCellWithReuseIdentifier: DeamonCollectionViewCell.identifier)
        collectionView.register(WeaponCollectionViewCell.nib, forCellWithReuseIdentifier: WeaponCollectionViewCell.identifier)
    }
    
    @IBAction func fightBtnTapped(_ sender: UIButton) {
        
    }
}

extension GameViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? viewModel.weapons.count : viewModel.selectedDeamons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeaponCollectionViewCell.identifier, for: indexPath) as? WeaponCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.weapon = viewModel.weapons[indexPath.row]
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeamonCollectionViewCell.identifier, for: indexPath) as? DeamonCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.deamon = viewModel.selectedDeamons[indexPath.row]
            return cell
        }
    }
}

extension GameViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.size.width - padding) / 2
        return CGSize(width: width, height: width)
    }
}
