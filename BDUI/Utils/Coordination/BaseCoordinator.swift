//
//  Coodinator.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import UIKit

protocol CoordinatorProtocol: DeeplinkHandlerProtocol {
    init(navigationController: UINavigationController?)
    func configure(with navigationController: UINavigationController?)
    func configureChild(_ child: CoordinatorProtocol)
    func start()
    func push(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func addChildCoordinator(_ child: BaseCoordinator)
}

extension CoordinatorProtocol {
    func canOpenURL(_ url: URL) -> Bool { false }
    func openURL(_ url: URL) {}
}

class BaseCoordinator: CoordinatorProtocol {
    private weak var navigationController: UINavigationController?

    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func configure(with navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func configureChild(_ child: CoordinatorProtocol) {
        child.configure(with: self.navigationController)
    }

    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }

    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }

    func present(_ viewController: UIViewController, animated: Bool) {
        navigationController?.present(viewController, animated: animated, completion: nil)
    }

    func addChildCoordinator(_ child: BaseCoordinator) {
        child.navigationController = navigationController
    }
}
