//
//  SceneDelegate.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = makeRootViewController()
        window?.makeKeyAndVisible()
    }
    
    private func makeRootViewController() -> AmountViewController {
        let vc = AmountViewController()
        vc.navigationController?.title = "Amout"
        return vc
    }
}
