//
//  AppCoordinator.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    init(window: UIWindow)

    func start()
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol)
    @discardableResult
    func handleURL(_ url: URL) -> Bool
}

final class AppCoordinator: AppCoordinatorProtocol {
    private let window: UIWindow
    private var childs = [CoordinatorProtocol]()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()

		let bduiCoordinator = BDUICoordinator(
			navigationController: navigationController
		)
		childs.append(bduiCoordinator)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

		bduiCoordinator.start()
    }

    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childs.append(childCoordinator)
    }

    @discardableResult
    func handleURL(_ url: URL) -> Bool {
        guard let childHandler = childs.first(where: { $0.canOpenURL(url) }) else {
            return false
        }

        childHandler.openURL(url)
        return true
    }
}
