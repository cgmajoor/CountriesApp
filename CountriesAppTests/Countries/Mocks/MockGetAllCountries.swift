//
//  MockGetAllCountries.swift
//  CountriesAppTests
//
//  Created by Ceren Majoor on 22/04/2024.
//

@testable import CountriesApp
import Foundation

class MockGetAllCountries: GetAllCountriesProtocol {

    public var invokedExecute = false
    public var stubbedResult: [Country] = []
    public var stubbedError: WebserviceError?

    func execute() async throws -> [Country] {
        self.invokedExecute = true

        if let stubbedError {
            throw stubbedError
        }

        return stubbedResult
    }
}
