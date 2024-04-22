//
//  GetAllCountriesProtocol.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

protocol GetAllCountriesProtocol {
    func execute() async throws -> [Country]
}
