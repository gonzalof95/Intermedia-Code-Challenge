//
//  String+Extension.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 15/12/2020.
//

import Foundation

extension String {
    func getAPIKey(key: String) -> String {
        guard let filePath = Bundle.main.path(forResource: "MVAPI-Info", ofType: "plist") else {
          fatalError("Couldn't find file 'MVAPI-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: key) as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'TMDB-Info.plist'.")
        }
        return value
    }
}