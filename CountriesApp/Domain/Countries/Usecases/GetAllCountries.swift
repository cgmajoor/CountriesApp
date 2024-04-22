//
//  GetAllCountries.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

class GetAllCountries: GetAllCountriesProtocol {

    // Add a repository layer when you have time
    private let countriesWebservice: CountriesWebserviceProtocol

    init(countriesWebservice: CountriesWebserviceProtocol = CountriesWebservice()) {
        self.countriesWebservice = countriesWebservice
    }

    func execute() async throws -> [Country] {
        let countries = try await self.countriesWebservice.fetchCountries().map { countryResponse in
            return countryResponse.toDomainModel()
        }

        return countries
    }
}
