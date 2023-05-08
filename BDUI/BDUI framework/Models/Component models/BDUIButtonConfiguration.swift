//
//  BDUIButtonConfiguration.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 08.05.2023.
//

import UIKit

public enum BDUIButtonConfiguration: String, Codable {
	case plain
	case gray
	case filled
	case borderless
	case borderlessTinted
	case borderedProminent
	case bordered

	var uikitConfiguration: UIButton.Configuration {
		switch self {
		case .plain:
			return .plain()
		case .gray:
			return .gray()
		case .filled:
			return .filled()
		case .borderless:
			return .borderless()
		case .borderlessTinted:
			return .borderedTinted()
		case .borderedProminent:
			return .borderedProminent()
		case .bordered:
			return .bordered()
		}
	}
}
