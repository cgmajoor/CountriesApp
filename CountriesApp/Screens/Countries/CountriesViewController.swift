//
//  CountriesViewController.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit

class CountriesViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        return tableView
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
        view.backgroundColor = .red

        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func configureHierarchy() {
        view.addSubview(tableView)
    }

    func configureLayout() {
        tableView.autoPinEdgesToSuperviewEdges()
    }

    func configureEvents() {
        viewModel.onStateChanged = { [weak self] state in
            guard let self else { return }

            switch state {
            case .loading:
                print("LOADING")
            case .error:
                print("ERROR")
            case .success:
                print("SUCCESS")
                self.tableView.reloadData()
            }
        }
    }
}
