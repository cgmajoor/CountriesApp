//
//  GetCountryResponse.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

struct GetCountryResponse: Decodable {
    let flags: FlagsResponse
    let name: CountryNameResponse
    let capital: [String]
    let region: String
    let population: Int

    func toDomainModel() -> CountryItem {
        return CountryItem(
            name: name.common,
            flagImageURL: flags.png,
            capital: capital.first ?? "",
            region: region,
            population: "\(population)"
        )
    }
}
