//
//  CAErrorView.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit
import Lottie

class CAErrorView: UIView {

    private let animationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "errorWorldAnimation")
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String) {
        titleLabel.text = title
        configure()
    }

    private func configure() {
        configureHierarchy()
        configureLayout()
    }
}

private extension CAErrorView {

    func configureHierarchy() {
        addSubview(animationView)
        addSubview(titleLabel)
    }

    func configureLayout() {
        animationView.autoCenterInSuperview()
        animationView.autoSetDimensions(to: .init(width: 200, height: 200))

        titleLabel.autoPinEdge(.top, to: .bottom, of: animationView, withOffset: 16.0)
        titleLabel.autoPinEdge(.leading, to: .leading, of: self, withOffset: 16.0)
        titleLabel.autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -16.0)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        titleLabel.autoAlignAxis(.vertical, toSameAxisOf: animationView)
    }
}
