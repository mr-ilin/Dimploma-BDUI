//
//  BDUITab.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 09.05.2023.
//

import Foundation

public struct BDUITab: Decodable {
	public typealias Id = String

	public let id: Id
	public let rootScreenUrl: URL
	public let title: String?
	public let image: String?
	public let navigationAppereance: BDUINavigationBarAppereance?
}
