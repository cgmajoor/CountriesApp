//
//  CountriesViewModel.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

class CountriesViewModel: CountriesViewModelProtocol {

    var onStateChanged: ((State) -> ())?
    var countries: [Country] = []

    private let getAllCountries: GetAllCountriesProtocol
    private let sortCountriesAlphabetically: SortCountriesAlphabetically

    init(
        getAllCountries: GetAllCountriesProtocol = GetAllCountries(),
        sortCountriesAlphabetically: SortCountriesAlphabetically = SortCountriesAlphabetically()) {
        self.getAllCountries = getAllCountries
        self.sortCountriesAlphabetically = sortCountriesAlphabetically
    }

    func loadCountries() {
        DispatchQueue.main.async { [weak self] in
            self?.onStateChanged?(.loading)
        }

        Task { [weak self] in
            guard let self else { return }

            do {
                self.countries = try await getAllCountries.execute()
                self.countries = sortCountriesAlphabetically.execute(countries: self.countries)
                DispatchQueue.main.async { [weak self] in
                    self?.onStateChanged?(.success)
                }
            } catch let err as WebserviceError {
                DispatchQueue.main.async { [weak self] in
                    self?.onStateChanged?(.error(err))
                }
            }
        }
    }
}
