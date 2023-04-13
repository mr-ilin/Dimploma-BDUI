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
    public let rootElement: BDUIComponentModel

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(BDUIScreen.Id.self, forKey: .id)
        self.rootElement = try container.decode(BDUIComponentModel.self, forKey: .rootElement)
    }

    private enum CodingKeys: CodingKey {
        case id
        case rootElement
    }
}
