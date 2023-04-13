//
//  BDUIDistributionType.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import UIKit

public enum BDUIDistributionType: String, Decodable {
    case fill
    case fillEqually
    case fillProportionally
    case equalSpacing
    case equalCentering

    var uikitDistributin: UIStackView.Distribution {
        switch self {
        case .fill:
            return .fill
        case .fillEqually:
            return .fillEqually
        case .fillProportionally:
            return .fillProportionally
        case .equalSpacing:
            return .equalSpacing
        case .equalCentering:
            return .equalCentering
        }
    }
}
