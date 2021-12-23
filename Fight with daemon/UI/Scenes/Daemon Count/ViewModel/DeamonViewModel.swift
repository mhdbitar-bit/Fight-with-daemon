//
//  DeamonViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/22/21.
//

import Foundation
import Combine

final class DeamonViewModel {
    let title: String = "Deamon Amount"
    @Published var amount: String = ""
    
    private(set) lazy var isInputValid = $amount
        .map { !$0.isEmpty && $0 != "0" }
        .eraseToAnyPublisher()
}
