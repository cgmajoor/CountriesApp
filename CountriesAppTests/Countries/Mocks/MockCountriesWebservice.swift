//
//  MockCountriesWebservice.swift
//  CountriesAppTests
//
//  Created by Ceren Majoor on 22/04/2024.
//

@testable import CountriesApp
import Foundation

class MockCountriesWebservice: CountriesWebserviceProtocol {

    public var invokedFetchCountries = false
    public var stubbedResponse: [CountryResponse] = []
    public var stubbedError: WebserviceError?

    func fetchCountries() async throws -> [CountriesApp.CountryResponse] {
        self.invokedFetchCountries = true

        if let stubbedError {
            throw stubbedError
        }

        return stubbedResponse
    }
}
