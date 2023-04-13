//
//  BDUIAxisType.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import UIKit

public enum BDUIAxisType: String, Decodable {
    case horizontal
    case vertical

    var uikitAxis: NSLayoutConstraint.Axis {
        switch self {
        case .horizontal:
            return .horizontal
        case .vertical:
            return .vertical
        }
    }
}
