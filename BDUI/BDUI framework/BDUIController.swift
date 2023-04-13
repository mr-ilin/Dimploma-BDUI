//
//  BDUIController.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import UIKit

protocol BDUIController: AnyObject {
    func render() -> UIView?
}

final class BDUIControllerImpl {
    private let configuration: BDUIConfiguration
    private let viewFactory: BDUIViewFactory

    private var screensById = [BDUIScreen.Id: BDUIScreen]()

    init(
        configuration: BDUIConfiguration,
        viewFactory: BDUIViewFactory
    ) {
        self.configuration = configuration
        self.viewFactory = viewFactory

        fillScreens()
    }

    private func fillScreens() {
        screensById = configuration.screens.reduce(
            into: [BDUIScreen.Id: BDUIScreen]()
        ) { result, screen in
            result[screen.id] = screen
        }
    }
}

extension BDUIControllerImpl: BDUIController {
    func render() -> UIView? {
        guard let mainScreen = screensById[configuration.mainScreenId] else {
            return nil
        }

        return viewFactory.createView(from: mainScreen.rootElement)
    }
}
