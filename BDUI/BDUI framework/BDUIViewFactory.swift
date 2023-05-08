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
		let bduiView = createView(from: screenModel.rootElement)

		vc.view.addSubview(bduiView)
		bduiView.edgesToSuperview(usingSafeArea: true)

		return vc
	}
}
