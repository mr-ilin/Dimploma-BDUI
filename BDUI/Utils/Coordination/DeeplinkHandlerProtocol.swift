//
//  DeeplinkHandlerProtocol.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 13.04.2023.
//

import Foundation

protocol DeeplinkHandlerProtocol {
    func canOpenURL(_ url: URL) -> Bool
    func openURL(_ url: URL)
}
