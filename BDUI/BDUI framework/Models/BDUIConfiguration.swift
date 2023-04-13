//
//  BDUIConfiguration.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import Foundation

public struct BDUIConfiguration: Decodable {
    public let mainScreenId: BDUIScreen.Id
    public let screens: [BDUIScreen]

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mainScreenId = try container.decode(BDUIScreen.Id.self, forKey: .mainScreenId)
        self.screens = try container.decode([BDUIScreen].self, forKey: .screens)
    }

    private enum CodingKeys: CodingKey {
        case mainScreenId
        case screens
    }
}
