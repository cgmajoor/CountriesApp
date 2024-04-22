//
//  Country.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

struct Country: Decodable {
    let flags: Flags
    let name: CountryName
    let capital: [String]
    let region: String
}
