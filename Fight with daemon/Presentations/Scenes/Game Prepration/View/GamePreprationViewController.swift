//
//  GamePreprationViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/21/21.
//

import UIKit
import Combine

final class GamePreprationViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: GamePreperationViewModel!
    
    convenience init(viewModel: GamePreperationViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = viewModel.title
        
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            WeaponCollectionViewCell.nib,
            forCellWithReuseIdentifier: WeaponCollectionViewCell.identifier
        )
        collectionView.allowsMultipleSelection = true
        collectionView.reloadData()
    }
}

extension GamePreprationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.weapons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeaponCollectionViewCell.identifier, for: indexPath) as? WeaponCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.weapon = viewModel.weapons[indexPath.row].createWeapon()
        return cell
    }
}

extension GamePreprationViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 20
        let width = (collectionView.frame.size.width - padding) / 2
        return CGSize(width: width, height: width)
    }
}

extension GamePreprationViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectWeapon(at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        viewModel.removeWeapon(at: indexPath.row)
    }
}
