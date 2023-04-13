//
//  Coodinator.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 06.04.2023.
//

import UIKit

class Coordinator {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }

    func configure(with navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func configureChild(_ child: Coordinator) {
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

    func addChildCoordinator(_ child: Coordinator) {
        child.navigationController = navigationController
    }
}
