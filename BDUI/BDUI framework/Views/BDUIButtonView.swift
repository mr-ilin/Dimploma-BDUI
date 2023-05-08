//
//  BDUIButtonView.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 08.05.2023.
//

import UIKit
import TinyConstraints

final class BDUIButtonView: BDUIView {
	// MARK: Views
	private let buttonView = UIButton()

	// MARK: Properties
	override var tapAction: (() -> Void)? {
		didSet {
			buttonView.addAction(UIAction { [weak self] _ in
				self?.handleTap()
			}, for: .touchUpInside)
		}
	}

	// MARK: Init
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		configureView()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		nil
	}

	private func configureView() {
		innerView.addSubview(buttonView)
		buttonView.edgesToSuperview(usingSafeArea: true)
	}

	// MARK: Setup
	override func setup(with viewModel: BDUIComponentModel) {
		super.setup(with: viewModel)

		setupButton(with: viewModel.content)
	}

	private func setupButton(with content: BDUIComponentContent?) {
		buttonView.configuration = content?.buttonConfiguration?.uikitConfiguration
		buttonView.setTitle(content?.text, for: .normal)
	}
}

