//
//  CountriesViewController.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit
import Lottie

class CountriesViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        return tableView
    }()

    private let loadingAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "loadingWorldAnimation")
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()

    private let errorView: CAErrorView = {
        let errorView = CAErrorView()
        errorView.configure(title: "Oops\nSomething went wrong\nPlease try again")
        return errorView
    }()

    private var viewModel: CountriesViewModel

    init(viewModel: CountriesViewModel = CountriesViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.loadCountries()
    }
}

extension CountriesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier, for: indexPath) as? CountryTableViewCell else {
            return UITableViewCell()
        }

        let country = viewModel.countries[indexPath.row]
        cell.configure(with: country)
        return cell
    }
}

extension CountriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SELECTED: \(viewModel.countries[indexPath.row])")
    }
}

private extension CountriesViewController {

    private func configure() {
        configureProperties()
        configureHierarchy()
        configureLayout()
        configureEvents()
    }

    func configureProperties() {
        view.backgroundColor = .systemBackground

        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func configureHierarchy() {
        view.addSubview(tableView)

        view.addSubview(loadingAnimationView)

        view.addSubview(errorView)
    }

    func configureLayout() {
        tableView.autoPinEdgesToSuperviewEdges()

        loadingAnimationView.autoSetDimensions(to: .init(width: 200, height: 200))
        loadingAnimationView.autoCenterInSuperview()

        errorView.autoPinEdgesToSuperviewEdges()
    }

    func configureEvents() {
        viewModel.onStateChanged = { [weak self] state in
            guard let self else { return }

            hideAllViews()

            switch state {
            case .loading:
                loadingAnimationView.isHidden = false
            case .error:
                errorView.isHidden = false
            case .success:
                tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
    }

    func hideAllViews() {
        loadingAnimationView.isHidden = true
        errorView.isHidden = true
        tableView.isHidden = true
    }
}
