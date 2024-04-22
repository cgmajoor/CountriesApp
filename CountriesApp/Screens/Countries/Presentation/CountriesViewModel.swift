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

    init(getAllCountries: GetAllCountriesProtocol = GetAllCountries()) {
        self.getAllCountries = getAllCountries
    }

    func loadCountries() {
        DispatchQueue.main.async { [weak self] in
            self?.onStateChanged?(.loading)
        }

        Task {
            do {
                self.countries = try await getAllCountries.execute()
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
