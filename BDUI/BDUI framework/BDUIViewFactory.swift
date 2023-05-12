//
//  BDUIViewModelFactory.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 08.04.2023.
//

import UIKit
import TinyConstraints

// MARK: - Protocols
public protocol BDUIViewFactoryDelegate: AnyObject {
	func handleAction(with url: URL)
}

public protocol BDUIViewFactory {
	func createViewController(for screenModel: BDUIScreen) -> UIViewController
	func createNavigationController(for tabModel: BDUITab) -> UINavigationController
	func createTabBarController(for tabAppearence: BDUITabBarAppearence?) -> UITabBarController
}

// MARK: - BDUIViewFactoryImpl
public final class BDUIViewFactoryImpl {
	weak var delegate: BDUIViewFactoryDelegate?

	private func createView(from model: BDUIComponentModel) -> UIView {
		let bduiView: BDUIView = {
			switch model.type {
			case .container:
				let containerView = BDUIContainerView()
				let subelements = model.elements.map {
					createView(from: $0)
				}
				containerView.addElements(with: subelements)

				return containerView

			case .spacer:
				return BDUISpacerView()
			case .label:
				return BDUILabelView()
			case .button:
				return BDUIButtonView()
			}
		}()

		bduiView.setup(with: model)
		if let url = model.tapUrlAction {
			bduiView.tapAction = { [weak delegate, url] in
				delegate?.handleAction(with: url)
			}
		}

		return bduiView
	}
}

// MARK: - BDUIViewFactory
extension BDUIViewFactoryImpl: BDUIViewFactory {
	public func createViewController(for screenModel: BDUIScreen) -> UIViewController {
		let vc = UIViewController()
		vc.navigationItem.title = screenModel.navigationItem?.title
		vc.navigationItem.largeTitleDisplayMode = (screenModel.navigationItem?.prefersLargeTitles ?? false)
		? .always
		: .never

		let bduiView = createView(from: screenModel.rootElement)
		vc.view.addSubview(bduiView)
		bduiView.edgesToSuperview(usingSafeArea: true)

		return vc
	}

	public func createNavigationController(for tabModel: BDUITab) -> UINavigationController {
		let vc = UINavigationController()
		vc.navigationBar.prefersLargeTitles = true
		vc.tabBarItem.title = tabModel.title
		if let imageName = tabModel.image {
			vc.tabBarItem.image = UIImage(systemName: imageName)
		}

		if let navigationAppereance = tabModel.navigationAppereance {
			let appearance = UINavigationBarAppearance()

			if let backgroundColor = navigationAppereance.backgroundColor {
				appearance.backgroundColor = UIColor(hex: backgroundColor)
			}

			if let hexColor = navigationAppereance.textColor,
			   let textColor = UIColor(hex: hexColor) {
				appearance.titleTextAttributes = [.foregroundColor: textColor]
				appearance.largeTitleTextAttributes = [.foregroundColor: textColor]
			}

			vc.navigationBar.standardAppearance = appearance
			vc.navigationBar.compactAppearance = appearance
			vc.navigationBar.scrollEdgeAppearance = appearance
		}

		return vc
	}

	public func createTabBarController(for tabAppearence: BDUITabBarAppearence?) -> UITabBarController {
		let tabBarController = UITabBarController()
		tabBarController.tabBar.isTranslucent = false

		if let tabAppearence {
			if let backgroundColor = tabAppearence.backgroundColor {
				tabBarController.tabBar.backgroundColor = UIColor(hex: backgroundColor)
			}

			if let tintColor = tabAppearence.tintColor {
				tabBarController.tabBar.tintColor = UIColor(hex: tintColor)
			}


			if let unselectedTintColor = tabAppearence.unselectedtintColor {
				tabBarController.tabBar.unselectedItemTintColor = UIColor(hex: unselectedTintColor)
			}
		}

		return tabBarController
	}
}
