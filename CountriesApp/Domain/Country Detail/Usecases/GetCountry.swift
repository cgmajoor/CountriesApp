//
//  GetCountry.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

class GetCountry: GetCountryProtocol {

    // TODO: Add a repository layer when you have time
    // TODO: Add unit tests if you have time
    private let countryWebservice: CountryWebserviceProtocol

    init(countryWebservice: CountryWebserviceProtocol = CountryWebservice()) {
        self.countryWebservice = countryWebservice
    }

    func execute(name: String = "") async throws -> CountryItem? {
        guard let country = try await self.countryWebservice.fetchCountry(name: name).first?.toDomainModel() else {
            return nil
        }

        return country
    }
}
