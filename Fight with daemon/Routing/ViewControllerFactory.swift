//
//  ViewControllerFactory.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import UIKit

protocol ViewControllerFactory {
    func weaponsViewController(for weapons: [Weapon], callback: @escaping (Weapon) -> Void) -> UIViewController
    func activityViewController(for activity: Activity, continueCallBack: @escaping (Result) -> Void, buyWeaponsCallback: @escaping () -> Void ) -> UIViewController
    func resultsViewController(for results: [Result], remaingWeapons: [Weapon], callback: @escaping (() -> Void)) -> UIViewController
}
