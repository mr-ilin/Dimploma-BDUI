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
	public let fontSize: Int?
	public let fontColor: String?

	// button
	public let buttonConfiguration: BDUIButtonConfiguration?
}
