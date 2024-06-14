//
//  BaseViewModel.swift
//  Presentation
//
//  Created by 윤지호 on 6/14/24.
//

import Foundation

protocol BaseViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
