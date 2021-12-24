//
//  ActivityViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import UIKit
import Combine

final class ActivityViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: ActivityViewModel!
    private var cancellables: Set<AnyCancellable> = []

    private let padding: CGFloat = 20
    private let headerID = "Header"
    
    convenience init(viewModel: ActivityViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            cell.deamon = viewModel.deamon
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
