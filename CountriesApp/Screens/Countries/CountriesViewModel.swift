//
//  CountriesViewModel.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

class CountriesViewModel {

    var countries: [Country] = []

    private let getAllCountries: GetAllCountriesProtocol

    init(getAllCountries: GetAllCountriesProtocol = GetAllCountries()) {
        self.getAllCountries = getAllCountries
    }

    func loadCountries() {
        Task {
            do {
                self.countries = try await getAllCountries.execute()
                DispatchQueue.main.async {
                    print(self.countries)
                }
            } catch let err as WebserviceError {
                print(err.rawValue)
            }
        }
    }
}
