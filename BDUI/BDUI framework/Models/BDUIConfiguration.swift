//
//  BDUIConfiguration.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import Foundation

public struct BDUIConfiguration: Decodable {
	public let tabs: [BDUITab]
    public let mainTabId: BDUITab.Id
    public let screens: [BDUIScreen]
}
