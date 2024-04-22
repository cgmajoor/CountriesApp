//
//  KeyValueView.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit

class KeyValueView: UIView {

    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()

    let keyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
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

    func configure(keyName: String, valueName: String) {
        keyLabel.text = keyName
        valueLabel.text = valueName
        configure()
    }

    private func configure() {
        configureHierarchy()
        configureLayout()
    }
}

private extension KeyValueView {

    func configureHierarchy() {
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(keyLabel)
        horizontalStackView.addArrangedSubview(valueLabel)
    }

    func configureLayout() {
        horizontalStackView.autoPinEdgesToSuperviewEdges()
    }
}

