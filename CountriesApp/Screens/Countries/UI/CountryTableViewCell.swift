//
//  CountryTableViewCell.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit
import PureLayout
import Kingfisher

class CountryTableViewCell: UITableViewCell {

    static let identifier = "CountryTableViewCell"

    internal let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        flagImageView.image = nil
        titleLabel.text = ""
    }

    func configure(with country: Country) {
        titleLabel.text = country.name
        
        let imageURL = URL(string: country.flagImageURL)
        flagImageView.kf.setImage(with: imageURL)
    }

    private func configure() {
        configureHierarchy()
        configureLayout()
    }
}

private extension CountryTableViewCell {

    func configureHierarchy() {
        contentView.addSubview(flagImageView)
        contentView.addSubview(titleLabel)
    }

    func configureLayout() {
        flagImageView.autoPinEdge(.top, to: .top, of: contentView, withOffset: 16.0)
        flagImageView.autoPinEdge(.leading, to: .leading, of: contentView, withOffset: 16.0)
        flagImageView.autoSetDimensions(to: .init(width: 50, height: 50))

        titleLabel.autoPinEdge(.leading, to: .trailing, of: flagImageView, withOffset: 16.0)
        titleLabel.autoPinEdge(.trailing, to: .trailing, of: contentView, withOffset: -16.0)
        titleLabel.autoAlignAxis(.horizontal, toSameAxisOf: flagImageView)
    }
}
