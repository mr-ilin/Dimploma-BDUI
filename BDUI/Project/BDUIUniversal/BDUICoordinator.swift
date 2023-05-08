//
//  BDUICoordinator.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 19.04.2023.
//

import UIKit

final class BDUICoordinator: BaseCoordinator {
	private lazy var manager: BDUIManager = BDUIManagerImpl(screenControllerOutput: self)

	override func start() {
		if let mainViewController = manager.screenController?.renderMain() {
			push(mainViewController, animated: true)
		}
	}

	func canOpenURL(_ url: URL) -> Bool {
		manager.screenController?.canOpenScreen(for: url) ?? false
	}

	func openURL(_ url: URL) {
		if let vc = manager.screenController?.render(by: url) {
			push(vc, animated: true)
		}
	}
}

extension BDUICoordinator: BDUIScreenControllerOutput {
	func openScreen(for url: URL) {
		guard canOpenURL(url) else {
			return
		}

		openURL(url)
	}
}
