//
//  ViewControllerFactory.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import UIKit

protocol ViewControllerFactory {
    func activityViewController(for activity: Activity, continueCallBack: @escaping (Result) -> Void, buyWeaponsCallback: @escaping () -> Void ) -> UIViewController
    func resultsViewController(for results: [Result]) -> UIViewController
}
