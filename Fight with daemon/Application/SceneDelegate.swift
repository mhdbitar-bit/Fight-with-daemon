//
//  SceneDelegate.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let navigationController = UINavigationController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
       
        navigationController.setViewControllers([makeGameViewController()], animated: false)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func makeGameViewController() -> GameFlowViewController {
        let viewModel = FightViewModel()
        let vc = GameFlowViewController(viewModel: viewModel)
        return vc
    }
}
