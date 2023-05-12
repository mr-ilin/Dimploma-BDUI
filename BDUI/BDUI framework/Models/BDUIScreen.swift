//
//  BDUIScreen.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 08.04.2023.
//

import Foundation

public struct BDUIScreen: Decodable {
    public typealias Id = String

    public let id: Id
	public let navigationItem: BDUIScreenNavigationItem?
    public let rootElement: BDUIComponentModel
}
