//
//  BDUIController.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import UIKit

// MARK: - Protocols
public protocol BDUIScreenControllerOutput: AnyObject {
	func openScreen(for url: URL)
}

public protocol BDUIScreensController: AnyObject {
    func renderMain() -> UIViewController?
	func render(by url: URL) -> UIViewController?
	func canOpenScreen(for url: URL) -> Bool
}

// MARK: - BDUIScreensControllerImpl
public final class BDUIScreensControllerImpl {
	// MARK: Private properties
    private let configuration: BDUIConfiguration
    private let viewFactory: BDUIViewFactory
	private let screensById: [BDUIScreen.Id: BDUIScreen]

	private weak var output: BDUIScreenControllerOutput?

	// MARK: Init
    public init(
        configuration: BDUIConfiguration,
        viewFactory: BDUIViewFactory,
		output: BDUIScreenControllerOutput?
    ) {
        self.configuration = configuration
        self.viewFactory = viewFactory
		self.output = output

		screensById = configuration.screens.reduce(
			into: [BDUIScreen.Id: BDUIScreen]()
		) { result, screen in
			result[screen.id] = screen
		}
    }

	private func render(by id: BDUIScreen.Id) -> UIViewController? {
		guard let screen = screensById[id] else {
			return nil
		}

		return viewFactory.createViewController(for: screen)
	}
}

// MARK: - BDUIScreensController
extension BDUIScreensControllerImpl: BDUIScreensController {
	public func renderMain() -> UIViewController? {
		render(by: configuration.mainScreenId)
	}

	public func render(by url: URL) -> UIViewController? {
		guard url.pathComponents.first == "open_screen",
			  let id = url.pathComponents[safe: 1]
		else {
			return nil
		}

		return render(by: id)
	}

	public func canOpenScreen(for url: URL) -> Bool {
		guard url.pathComponents.first == "open_screen",
			  let id = url.pathComponents[safe: 1]
		else {
			return false
		}

		return screensById[id] != nil
	}
}

// MARK: - BDUIViewFactoryDelegate
extension BDUIScreensControllerImpl: BDUIViewFactoryDelegate {
	public func handleAction(with url: URL) {
		if url.pathComponents.first == "open_screen" {
			output?.openScreen(for: url)
		}
	}
}
