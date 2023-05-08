//
//  BDUIComponentContent.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import Foundation

/// Унифицированная структура контента всех компонентов
public struct BDUIComponentContent: Codable, Equatable {
	// common
	public let text: String?

    // label
    public let numberOfLines: Int?
    public let textAlignment: BDUITextAlignment?
    public let fontStyle: BDUIFontStyle?

	// button
	public let buttonConfiguration: BDUIButtonConfiguration?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.numberOfLines = try container.decodeIfPresent(Int.self, forKey: .numberOfLines)
        self.textAlignment = try container.decodeIfPresent(BDUITextAlignment.self, forKey: .textAlignment)
        self.fontStyle = try container.decodeIfPresent(BDUIFontStyle.self, forKey: .fontStyle)
		self.buttonConfiguration = try container.decodeIfPresent(BDUIButtonConfiguration.self, forKey: .buttonConfiguration)
    }

    private enum CodingKeys: CodingKey {
        case text
        case numberOfLines
        case textAlignment
        case fontStyle
		case buttonConfiguration
    }
}
