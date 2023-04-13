//
//  BDUILayout.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import Foundation

/// Модель layout'а `BDUIComponentModel`
public struct BDUILayout: Decodable, Equatable {
    public let height: CGFloat?
    public let width: CGFloat?
    public let paddings: BDUIPaddings?

    public let axis: BDUIAxisType?
    public let distribution: BDUIDistributionType?
    public let alignment: BDUIAlignmentType?
    public let spacing: CGFloat?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.height = try container.decodeIfPresent(CGFloat.self, forKey: .height)
        self.width = try container.decodeIfPresent(CGFloat.self, forKey: .width)
        self.paddings = try container.decodeIfPresent(BDUIPaddings.self, forKey: .paddings)
        self.axis = try container.decodeIfPresent(BDUIAxisType.self, forKey: .axis)
        self.distribution = try container.decodeIfPresent(BDUIDistributionType.self, forKey: .distribution)
        self.alignment = try container.decodeIfPresent(BDUIAlignmentType.self, forKey: .alignment)
        self.spacing = try container.decodeIfPresent(CGFloat.self, forKey: .spacing)
    }

    private enum CodingKeys: CodingKey {
        case height
        case width
        case paddings
        case axis
        case distribution
        case alignment
        case spacing
    }
}
