//
//  BDUIElement.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import Foundation

/// Основная модель, имеет уникальный `id` и определенный `type` с параметрами отображения
public struct BDUIComponentModel: Decodable, Equatable {
    public let type: BDUIComponentType
    public let layout: BDUILayout?
    public let border: BDUIBorder?
    public let appereance: BDUIAppereance?
    public let elements: [BDUIComponentModel]
    public let content: BDUIComponentContent?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(BDUIComponentType.self, forKey: .type)
        self.layout = try container.decodeIfPresent(BDUILayout.self, forKey: .layout)
        self.border = try container.decodeIfPresent(BDUIBorder.self, forKey: .border)
        self.appereance = try container.decodeIfPresent(BDUIAppereance.self, forKey: .appereance)
        self.elements = try container.decodeIfPresent([BDUIComponentModel].self, forKey: .elements) ?? []
        self.content = try container.decodeIfPresent(BDUIComponentContent.self, forKey: .content)
    }

    private enum CodingKeys: CodingKey {
        case type
        case layout
        case border
        case appereance
        case elements
        case content
    }
}
