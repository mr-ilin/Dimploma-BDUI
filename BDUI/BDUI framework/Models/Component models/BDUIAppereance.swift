//
//  BDUIAppereance.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import Foundation

/// Модель параметров отображения `BDUIComponentModel`
public struct BDUIAppereance: Decodable, Equatable {
    public let backgroundColor: String?
    public let isHidden: Bool

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backgroundColor = try container.decodeIfPresent(String.self, forKey: .backgroundColor)
        self.isHidden = try container.decodeIfPresent(Bool.self, forKey: .isHidden) ?? false
    }

    private enum CodingKeys: CodingKey {
        case backgroundColor
        case isHidden
    }
}
