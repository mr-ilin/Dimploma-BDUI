//
//  BDUITextAlignment.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 13.04.2023.
//

import UIKit

public enum BDUITextAlignment: String, Codable {
    case `left`
    case center
    case `right`
    case justified
    case natural

    var uikitAlignment: NSTextAlignment {
        switch self {
        case .left:
            return .left
        case .center:
            return .center
        case .right:
            return .right
        case .justified:
            return .justified
        case .natural:
            return .natural
        }
    }
}
