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
}

final class AppCoordinator: AppCoordinatorProtocol {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()

        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
