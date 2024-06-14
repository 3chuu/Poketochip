//
//  PresentaionDIProvider.swift
//  Presentation
//
//  Created by 윤지호 on 6/14/24.
//

import Foundation

public protocol PresentaionDIProvider {
  func makeDetailViewController(pokemonId: Int) -> DetailViewController
}
