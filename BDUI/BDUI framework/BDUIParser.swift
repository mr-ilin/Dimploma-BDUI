//
//  BDUIParser.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import Foundation

enum BDUIParser {
    /// Парсинг конфигурации из json файла
    /// - Parameter json: входной json файл
    /// - Returns: конфигурацию 
//    static func parseUIConfiguration(from json: String) -> BDUIConfiguration? {
//        guard let jsonData = json.data(using: .utf8) else {
//            return nil
//        }
//
//        do {
//            let uiConfiguration = try JSONDecoder().decode(BDUIConfiguration.self, from: jsonData)
//            return uiConfiguration
//        } catch {
//            NSLog("Error parsing UI configuration: \(error)")
//            return nil
//        }
//    }

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
