//
//  BDUIContainerView.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 11.04.2023.
//

import UIKit
import TinyConstraints

final class BDUIContainerView: BDUIView {
    // MARK: Views
    private let stackView = UIStackView()

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
        innerView.addSubview(stackView)
		stackView.edgesToSuperview(usingSafeArea: true)
    }

    // MARK: Setup
    override func setup(with viewModel: BDUIComponentModel) {
        super.setup(with: viewModel)

        setupStack(with: viewModel.layout)
    }

    func addElements(with elements: [UIView]) {
        elements.forEach {
            stackView.addArrangedSubview($0)
        }
    }

    private func setupStack(with layout: BDUILayout?) {
        stackView.axis = layout?.axis?.uikitAxis ?? .vertical
        stackView.distribution = layout?.distribution?.uikitDistributin ?? .fill
        stackView.alignment = layout?.alignment?.uikitAlignment ?? .fill
        stackView.spacing = layout?.spacing ?? 0
    }
}
