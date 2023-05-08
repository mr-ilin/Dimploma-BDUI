//
//  BDUIParser.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import Foundation

enum BDUIParser {
    static func parseUIConfiguration(jsonData: Data) -> BDUIConfiguration? {
        do {
            let uiConfiguration = try JSONDecoder().decode(BDUIConfiguration.self, from: jsonData)
            return uiConfiguration
        } catch {
            NSLog("Error parsing UI configuration: \(error)")
            return nil
        }
    }
}
