//
//  ActivityViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import UIKit

final class ActivityViewController: UIViewController, Alertable {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var actionButton: UIButton!
    
    private var viewModel: ActivityViewModel!
    private var continueAction: ((Result) -> Void)? = nil
    private var buyWeaponsAction: (() -> Void)? = nil
    
    private let padding: CGFloat = 20
    private let headerID = "Header"
    
    convenience init(viewModel: ActivityViewModel, continueAction: @escaping (Result) -> Void, buyWeaponsAction: @escaping (() -> Void)) {
        self.init()
        self.viewModel = viewModel
        self.continueAction = continueAction
        self.buyWeaponsAction = buyWeaponsAction
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fight"
        self.navigationItem.setHidesBackButton(true, animated: false)
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCollectionViewCells()
        setupCollectionHeaderSize()
        collectionView.reloadData()
    }
    
    private func registerCollectionViewCells() {
        collectionView.register(DeamonCollectionViewCell.nib, forCellWithReuseIdentifier: DeamonCollectionViewCell.identifier)
        collectionView.register(WeaponCollectionViewCell.nib, forCellWithReuseIdentifier: WeaponCollectionViewCell.identifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerID)
    }
    
    private func setupCollectionHeaderSize() {
        let flow = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.headerReferenceSize = CGSize(width: collectionView.frame.width, height: 30)
    }
    
    @IBAction func actionBtnTapped(_ sender: UIButton) {
        let fightResult = viewModel.fight()
        if fightResult.state == .Lose && viewModel.amount > 0 {
            displayBuyWeaponsSheet(fightResult)
        } else {
            continueBattle(fightResult)
        }
    }
}

extension ActivityViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? viewModel.weapons.count : 1
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
            cell.deamon = viewModel.demon
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           var view : UICollectionReusableView! = nil
           if kind == UICollectionView.elementKindSectionHeader {
               view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerID, for: indexPath)
               if view.subviews.count == 0 {
                   view.addSubview(UILabel(frame:CGRect(x: 0,y: 0,width: collectionView.frame.width, height: 30)))
               }
               let label = view.subviews[0] as! UILabel
               if indexPath.section == 0 {
                   label.text = "Weappons"
               } else {
                   label.text = "Deamon"
               }
               label.textAlignment = .center
           }
           return view
       }
}

extension ActivityViewController: UICollectionViewDelegateFlowLayout {
    
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

extension ActivityViewController {
    private func continueBattle(_ fightResult: Result) {
        continueAction?(fightResult)
    }
    
    private func displayWeapons() {
        buyWeaponsAction?()
    }
    
    private func displayBuyWeaponsSheet(_ fightResult: Result) {
        showActionsheet(title: "Info", message: "Looks you have some \(viewModel.amount) amounts, do you want to buy some weapons?", actions: [
            ("Get new Weapons", .default),
            ("Continue", .cancel)
        ]) { [weak self] index in
            guard let self = self else { return }
            if index == 0 {
                self.displayWeapons()
            } else {
                self.continueBattle(fightResult)
            }
        }
    }
}
