//
//  BDUIBorder.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import Foundation

/// Модель границ `BDUIComponentModel`
public struct BDUIBorder: Decodable, Equatable {
    public let color: String?
    public let width: CGFloat?
    public let cornerRadius: CGFloat?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        self.width = try container.decodeIfPresent(CGFloat.self, forKey: .width)
        self.cornerRadius = try container.decodeIfPresent(CGFloat.self, forKey: .cornerRadius)
    }

    private enum CodingKeys: CodingKey {
        case color
        case width
        case cornerRadius
    }
}
