//
//  BDUIPaddings.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import Foundation

/// Модель отступа у элемента `BDUIComponentModel`
public struct BDUIPaddings: Decodable, Equatable {
    public let top: CGFloat
    public let left: CGFloat
    public let right: CGFloat
    public let bottom: CGFloat

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.top = try container.decodeIfPresent(CGFloat.self, forKey: .top) ?? 0
        self.left = try container.decodeIfPresent(CGFloat.self, forKey: .left) ?? 0
        self.right = try container.decodeIfPresent(CGFloat.self, forKey: .right) ?? 0
        self.bottom = try container.decodeIfPresent(CGFloat.self, forKey: .bottom) ?? 0
    }

    private enum CodingKeys: CodingKey {
        case top
        case left
        case right
        case bottom
    }
}
