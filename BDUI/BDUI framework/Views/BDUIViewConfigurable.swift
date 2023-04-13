//
//  BDUIViewConfigurable.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 10.04.2023.
//

import UIKit

protocol BDUIViewConfigurable: UIView {
    func setup(with viewModel: BDUIComponentModel)
}
