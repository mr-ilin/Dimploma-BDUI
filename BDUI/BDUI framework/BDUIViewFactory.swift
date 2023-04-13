//
//  BDUIViewModelFactory.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 08.04.2023.
//

import UIKit

protocol BDUIViewFactory {
    func createView(from model: BDUIComponentModel) -> UIView
}

final class BDUIViewFactoryImpl {}

extension BDUIViewFactoryImpl: BDUIViewFactory {
    func createView(from model: BDUIComponentModel) -> UIView {
        switch model.type {
        case .container:
            let containerView = BDUIContainerView()
            containerView.setup(with: model)

            let subelements = model.elements.map {
                createView(from: $0)
            }
            containerView.addElements(with: subelements)

            return containerView

        case .spacer:
            let spacerView = BDUISpacerView()
            spacerView.setup(with: model)

            return spacerView

        case .label:
            let labelView = BDUILabelView()
            labelView.setup(with: model)

            return labelView

        }
    }
}
