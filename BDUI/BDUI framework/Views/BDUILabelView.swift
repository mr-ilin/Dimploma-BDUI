//
//  BDUILabel.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 11.04.2023.
//

import UIKit
import TinyConstraints

final class BDUILabelView: BDUIView {
    // MARK: Views
    private let labelView = UILabel()

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
        innerView.addSubview(labelView)
        labelView.edgesToSuperview()
    }

    // MARK: Setup
    override func setup(with viewModel: BDUIComponentModel) {
        super.setup(with: viewModel)

        setupLabel(with: viewModel.content)
    }

    private func setupLabel(with content: BDUIComponentContent?) {
        labelView.text = content?.text
        labelView.numberOfLines = content?.numberOfLines ?? 0

        if let textAlignment = content?.textAlignment {
            labelView.textAlignment = textAlignment.uikitAlignment
        }

        if let textStyle = content?.fontStyle {
            labelView.font = .preferredFont(forTextStyle: textStyle.uikitFont)
        }

    }
}
