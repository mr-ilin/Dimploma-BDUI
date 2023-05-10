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
	private lazy var manager: BDUIManager = BDUIManagerImpl(screenControllerOutput: self)

    private let window: UIWindow
    private var childs = [CoordinatorProtocol]()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
		let tabBarController = UITabBarController()
		tabBarController.tabBar.tintColor = .tintColor
		tabBarController.tabBar.isTranslucent = false

		var viewControllers = [UIViewController]()
		manager.screenController.tabsModels().forEach { tabModel in
			let vc = UINavigationController()
			vc.navigationItem.title = tabModel.title
			vc.tabBarItem.title = tabModel.title
			if let imageName = tabModel.image {
				vc.tabBarItem.image = UIImage(systemName: imageName)
			}

			let coordinator = BDUICoordinator(
				screenController: manager.screenController,
				navigationController: vc,
				assosiatedTabId: tabModel.id,
				initialUrl: tabModel.rootScreenUrl
			)

			viewControllers.append(vc)
			childs.append(coordinator)
			coordinator.start()
		}

		tabBarController.setViewControllers(viewControllers, animated: false)

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
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

extension AppCoordinator: BDUIScreenControllerOutput {
	func openScreen(for url: URL) {
		handleURL(url)
	}
}
