//
//  BDUIAlignmentType.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import UIKit

public enum BDUIAlignmentType: String, Decodable {
    case fill
    case leading
    case top
    case firstBaseline
    case center
    case trailing
    case bottom
    case lastBaseline

    var uikitAlignment: UIStackView.Alignment {
        switch self {
        case .fill:
            return .fill
        case .leading:
            return .leading
        case .top:
            return .top
        case .firstBaseline:
            return .firstBaseline
        case .center:
            return .center
        case .trailing:
            return .trailing
        case .bottom:
            return .bottom
        case .lastBaseline:
            return .lastBaseline
        }
    }
}
