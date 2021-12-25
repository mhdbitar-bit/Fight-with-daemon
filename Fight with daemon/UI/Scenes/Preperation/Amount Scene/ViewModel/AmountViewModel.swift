//
//  AmountViewModel.swift
//  Fight with daemon
//
//  Created by Mohammad Bitar on 12/20/21.
//

import Foundation
import Combine

final class AmountViewModel {
    
    let title: String = "Amount"
    @Published var amount: String = ""
    
    private(set) lazy var isInputValid = $amount
        .map { !$0.isEmpty && $0 != "0" }
        .eraseToAnyPublisher()
}
