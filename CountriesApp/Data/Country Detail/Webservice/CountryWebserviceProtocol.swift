//
//  CountryWebserviceProtocol.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

protocol CountryWebserviceProtocol {
    func fetchCountry(name: String) async throws -> [GetCountryResponse]
}
