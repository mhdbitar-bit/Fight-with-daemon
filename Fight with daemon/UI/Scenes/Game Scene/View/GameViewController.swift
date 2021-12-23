//
//  GameViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/22/21.
//

import UIKit
import Combine

class GameViewController: UIViewController, Lodable {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: GameViewModel!
    private var delegate: GameFlowViewDelegate?
    private var cancellables: Set<AnyCancellable> = []
    var activityIndicator = UIActivityIndicatorView()
    
    private let padding: CGFloat = 20
    private let headerID = "Header"
    
    
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
        
        self.title = viewModel.title
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DeamonCollectionViewCell.nib, forCellWithReuseIdentifier: DeamonCollectionViewCell.identifier)
        collectionView.register(WeaponCollectionViewCell.nib, forCellWithReuseIdentifier: WeaponCollectionViewCell.identifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerID)
        
        let flow = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.headerReferenceSize = CGSize(width: collectionView.frame.width,height: 30)
    }
    
    @IBAction func fightBtnTapped(_ sender: UIButton) {
        showSpinner()
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
                   label.text = "Deamons"
               }
               label.textAlignment = .center
           }
           return view
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
