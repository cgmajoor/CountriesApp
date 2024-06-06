//
//  SortCountriesAlphabetically.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 06/06/2024.
//

import Foundation

class SortCountriesAlphabetically {

    func execute(countries: [Country]) -> [Country] {
        return countries.sorted { $0.name < $1.name }
    }
}
