//
//  BDUICoordinator.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 19.04.2023.
//

import UIKit

final class BDUICoordinator: BaseCoordinator {
	private weak var screenController: BDUIScreensController?

	private let assosiatedTabId: BDUITab.Id
	private let initialUrl: URL

	init(
		screenController: BDUIScreensController?,
		navigationController: UINavigationController,
		assosiatedTabId: BDUITab.Id,
		initialUrl: URL
	) {
		self.screenController = screenController
		self.assosiatedTabId = assosiatedTabId
		self.initialUrl = initialUrl
		
		super.init(navigationController: navigationController)
	}

	required init(navigationController: UINavigationController?) {
		fatalError()
	}

	override func start() {
		openURL(initialUrl)
	}

	override func canOpenURL(_ url: URL) -> Bool {
		screenController?.canOpenScreen(for: url, from: assosiatedTabId) ?? false
	}

	override func openURL(_ url: URL) {
		if let vc = screenController?.render(by: url) {
			push(vc, animated: true)
		}
	}
}
