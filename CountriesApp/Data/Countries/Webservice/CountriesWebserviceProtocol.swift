//
//  CountriesWebserviceProtocol.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

protocol CountriesWebserviceProtocol {
    func fetchCountries() async throws -> [CountryResponse]
}
