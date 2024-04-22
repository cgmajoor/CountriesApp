//
//  CountryDetailViewController.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit
import Lottie

class CountryDetailViewController: UIViewController {

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
        view.backgroundColor = .red
    }

    func configureHierarchy() {
        // TODO: add views
    }

    func configureLayout() {
        // TODO: layout views
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
            }
        }
    }
}

