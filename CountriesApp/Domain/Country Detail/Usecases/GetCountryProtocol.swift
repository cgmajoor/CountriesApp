//
//  GetCountryProtocol.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

protocol GetCountryProtocol {
    func execute(name: String) async throws -> CountryItem?
}
