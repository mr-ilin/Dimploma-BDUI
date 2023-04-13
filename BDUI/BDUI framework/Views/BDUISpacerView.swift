//
//  BDUISpacerView.swift
//  BDUI
//
//  Created by Ильин Илья Олегович on 12.04.2023.
//

import UIKit

final class BDUISpacerView: BDUIView {
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
        setContentHuggingPriority(.defaultLow, for: .horizontal)
        setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}
