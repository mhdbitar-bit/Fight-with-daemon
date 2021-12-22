//
//  GamePreprationViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/21/21.
//

import UIKit
import Combine

final class GamePreprationViewController: UIViewController {
    
    @IBOutlet weak var boardView: UIView! {
        didSet {
            self.boardView.setRoundedConrerWith(corner: 12, width: 1, color: .black.withAlphaComponent(0.2))
        }
    }
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var weaponsCountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var startButton: UIButton!
    
    var viewModel: GamePreperationViewModel!
    private var cancellables: Set<AnyCancellable> = []
    private let padding: CGFloat = 20
    
    convenience init(viewModel: GamePreperationViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel.title
        
        setupCollectionView()
        
        viewModel.fetchWeapons()
        bindViewModel()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            WeaponCollectionViewCell.nib,
            forCellWithReuseIdentifier: WeaponCollectionViewCell.identifier
        )
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = true
        collectionView.reloadData()
    }
    
    private func bindViewModel() {
        bindWeapons()
        bindAmount()
        bindSelectedWeapons()
    }
    
    private func bindWeapons() {
        viewModel.$weapons.sink { [weak self] _ in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }.store(in: &cancellables)
    }
    
    private func bindAmount() {
        viewModel.$amount.sink { [weak self] amount in
            guard let self = self else { return }
            self.amountLabel.text = "Amount: \(amount)"
        }.store(in: &cancellables)
    }
    
    private func bindSelectedWeapons() {
        viewModel.$selectedWeapons.sink { [weak self] weapons in
            guard let self = self else { return }
            self.weaponsCountLabel.text = "Selected Weapons count: \(weapons.count)"
            self.startButton.isEnabled = !weapons.isEmpty
        }.store(in: &cancellables)
    }
        
    @IBAction func startBtnTapped(_ sender: UIButton) {
        let viewModel = DeamonViewModel()
        let vc = DeaomCountViewController(viewModel: viewModel)
        self.show(vc, sender: self)
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
        cell.weapon = viewModel.weapons[indexPath.row]
        return cell
    }
}

extension GamePreprationViewController: UICollectionViewDelegateFlowLayout {
    
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

extension GamePreprationViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectWeapon(at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        viewModel.removeWeapon(at: indexPath.row)
    }
}
