//
//  Bundle + Extension.swift
//  Infrastructure
//
//  Created by cha_nyeong on 5/14/24.
//

import Foundation

extension Bundle {
    public static var baseUrl : String {
        guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist"),
              let plistDict = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't find file 'Info.plist'.")
        }
        
        guard let value = plistDict.object(forKey: "BaseURL") as? String else {
            fatalError("Couldn't find key 'BaseURL' in 'Info.plist'.")
        }
        
        // guard let value = plistDict["API_KEY"] as? String else {
        //     fatalError("Couldn't find key 'API_Key' in 'SecureAPIKeys.plist'.")
        // }
        
        return value
    }
}
