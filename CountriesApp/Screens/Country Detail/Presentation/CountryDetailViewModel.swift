//
//  CountryDetailViewModel.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

// TODO: Add unit tests if you have time
class CountryDetailViewModel: CountryDetailViewModelProtocol {

    var onStateChanged: ((State) -> ())?
    var country: CountryItem?

    private let name: String
    private let getCountry: GetCountryProtocol

    init(
        name: String,
        getCountry: GetCountryProtocol = GetCountry()
    ) {
        self.name = name
        self.getCountry = getCountry
    }

    func loadCountry() {
        DispatchQueue.main.async { [weak self] in
            self?.onStateChanged?(.loading)
        }

        Task { [weak self] in
            guard let self else { return }

            do {
                self.country = try await getCountry.execute(name: name)
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    print("population: \(String(describing: self.country?.population))")
                    self.onStateChanged?(.success)
                }
            } catch let err as WebserviceError {
                DispatchQueue.main.async { [weak self] in
                    print("err: \(String(describing: err.rawValue))")
                    self?.onStateChanged?(.error(err))
                }
            }
        }
    }
}
