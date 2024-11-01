//
//  CountryDetailViewController.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit
import Lottie

class CountryDetailViewController: UIViewController {

    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()

    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()


    private var viewModel: CountryDetailViewModelProtocol

    init(viewModel: CountryDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.loadCountry()
    }
}

private extension CountryDetailViewController {

    private func configure() {
        configureProperties()
        configureHierarchy()
        configureLayout()
        configureEvents()
    }

    func configureProperties() {
        view.backgroundColor = .systemBackground
    }

    func configureHierarchy() {
        view.addSubview(verticalStackView)
    }

    func configureLayout() {
        verticalStackView.autoPinEdges(toSuperviewMarginsExcludingEdge: .bottom)
    }

    func configureEvents() {
        viewModel.onStateChanged = { [weak self] state in
            guard let self else { return }

            switch state {
            case .loading:
                print("loading")
            case .error:
                print("error")
            case .success:
                print("success")

                guard let country = viewModel.country else { return }
                renderStackView(with: country)
            }
        }
    }

    func renderStackView(with country: CountryItem) {
        verticalStackView.subviews.forEach {
            $0.removeFromSuperview()
        }

        let imageURL = URL(string: country.flagImageURL)
        flagImageView.kf.setImage(with: imageURL)
        verticalStackView.addArrangedSubview(flagImageView)

        let nameView = KeyValueView()
        nameView.configure(keyName: "Name", valueName: country.name)
        verticalStackView.addArrangedSubview(nameView)

        let capitalView = KeyValueView()
        capitalView.configure(keyName: "Capital", valueName: country.capital)
        verticalStackView.addArrangedSubview(capitalView)

        let regionView = KeyValueView()
        regionView.configure(keyName: "Region", valueName: country.region)
        verticalStackView.addArrangedSubview(regionView)


        let populationView = KeyValueView()
        populationView.configure(keyName: "Population", valueName: country.population)
        verticalStackView.addArrangedSubview(populationView)
    }
}

