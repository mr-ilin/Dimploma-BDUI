//
//  BDUIComponentContent.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import Foundation

/// Унифицированная структура контента всех компонентов
public struct BDUIComponentContent: Codable, Equatable {
    // label
    public let text: String?
    public let numberOfLines: Int?
    public let textAlignment: String?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.numberOfLines = try container.decodeIfPresent(Int.self, forKey: .numberOfLines)
        self.textAlignment = try container.decodeIfPresent(String.self, forKey: .textAlignment)
    }

    private enum CodingKeys: CodingKey {
        case text
        case numberOfLines
        case textAlignment
    }
}
