//
//  CountriesRouter.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit

protocol CountriesRouting {
    func didSelectCountry(in viewController: CountriesViewController, countryName: String)
}

class CountriesRouter: CountriesRouting {
    func didSelectCountry(in viewController: CountriesViewController, countryName: String) {
        let viewModel = CountryDetailViewModel(name: countryName)
        let countryDetailViewController = CountryDetailViewController(viewModel: viewModel)
        viewController.navigationController?.pushViewController(countryDetailViewController, animated: true)
    }
}
