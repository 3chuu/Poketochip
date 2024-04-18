//
//  LinkStruct.swift
//  Domain
//
//  Created by cha_nyeong on 4/18/24.
//

import Foundation

public struct Faq: Linkable {
    public let linkUrl: String
    
    func canOpenUrl(linkUrl: String) {
        
    }
}

public struct Term: Linkable {
    public let linkUrl: String
    
    func canOpenUrl(linkUrl: String) {
        
    }
}

public struct License: Linkable {
    public let linkUrl: String
    
    func canOpenUrl(linkUrl: String) {
        
    }
}

protocol Linkable {
    var linkUrl: String { get }
    
    func canOpenUrl(linkUrl: String)
}
