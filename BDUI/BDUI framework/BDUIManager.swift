//
//  BDUIManager.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 13.04.2023.
//

import Foundation

// MARK: - Protocols
public protocol BDUIManager {
    var screenController: BDUIScreensController { get }
}

// MARK: - BDUIManagerImpl
final public class BDUIManagerImpl: BDUIManager {
	// MARK: Private properties
    private let viewFactory: BDUIViewFactoryImpl

	// MARK: Public properties
	public let screenController: BDUIScreensController

	// MARK: Init
	init(screenControllerOutput: BDUIScreenControllerOutput?) {
		viewFactory = BDUIViewFactoryImpl()
		let screenController: BDUIScreensControllerImpl = { [viewFactory] in
            let configuration = BDUIManagerImpl.getConfiguration()!

            return BDUIScreensControllerImpl(
                configuration: configuration,
                viewFactory: viewFactory,
				output: screenControllerOutput
            )
        }()

		self.screenController = screenController
		viewFactory.delegate = screenController
    }

	// MARK: Private methods
    private static func getConfiguration() -> BDUIConfiguration? {
        guard let path = Bundle.main.path(forResource: "configuration", ofType: "json") else {
            return nil
        }

        do {
            let configurationData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return BDUIParser.parseUIConfiguration(jsonData: configurationData)
        } catch {
            NSLog("Cant get file")
            return nil
        }
    }
}
