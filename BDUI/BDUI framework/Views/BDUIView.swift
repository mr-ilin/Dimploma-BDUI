//
//  BDUIView.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 10.04.2023.
//

import UIKit
import TinyConstraints

class BDUIView: UIView, BDUIViewConfigurable {
    // MARK: Properties
    private var viewModel: BDUIComponentModel?

    // MARK: Views
    let innerView = UIView()
    private var insetsConstraints: Constraints?

    // MARK: Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        addSubview(innerView)
        insetsConstraints = innerView.edgesToSuperview()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        nil
    }

    // MARK: Layout
    private func updateLayout() {
        guard let layoutModel = viewModel?.layout else {
            return
        }

        if let heightValue = layoutModel.height {
            height(heightValue)
        }
        if let widthValue = layoutModel.width {
            width(widthValue)
        }
        if let paddings = viewModel?.layout?.paddings {
            insetsConstraints?.deActivate()
            insetsConstraints = innerView.edgesToSuperview(insets: TinyEdgeInsets(
                top: paddings.top,
                left: paddings.left,
                bottom: paddings.bottom,
                right: paddings.right
            ))
        }
    }

    // MARK: Setup
    func setup(with viewModel: BDUIComponentModel) {
        self.viewModel = viewModel

        updateLayout()
        setupBorders(for: viewModel.border)
        setupAppereance(for: viewModel.appereance)
    }

    private func setupBorders(for model: BDUIBorder?) {
        guard let model else { return }

        if let hexBorderColor = model.color {
            layer.borderColor = UIColor(hex: hexBorderColor)?.cgColor
        }
        if let borderWidth = model.width {
            layer.borderWidth = borderWidth
        }
        if let cornerRadius = model.cornerRadius {
            clipsToBounds = true
            layer.cornerRadius = cornerRadius
        }
    }

    private func setupAppereance(for model: BDUIAppereance?) {
        guard let model else { return }

        if let hexColor = model.backgroundColor {
            backgroundColor = UIColor(hex: hexColor)
        }
        isHidden = model.isHidden
    }
}
