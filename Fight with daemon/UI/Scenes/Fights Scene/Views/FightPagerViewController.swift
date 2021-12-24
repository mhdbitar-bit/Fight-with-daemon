//
//  FightPagerViewController.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/24/21.
//

import UIKit

final class FightPagerViewController: UIPageViewController {
    
    required init(coder: NSCoder? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        dataSource = self
    }
    
    func loadFightes(viewController: UIViewController) {
        setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
    }
}

//extension GamePagerViewController: UIPageViewControllerDataSource {
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        return nil
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        return nil
//    }
//}
