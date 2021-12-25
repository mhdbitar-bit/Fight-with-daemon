//
//  ViewControllerFactory.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/25/21.
//

import UIKit

protocol ViewControllerFactory {    
    func activityViewController(for activity: Activity, fightCallBack: @escaping (Result) -> Void) -> UIViewController
    func resultsViewController(for results: [Result]) -> UIViewController
}
