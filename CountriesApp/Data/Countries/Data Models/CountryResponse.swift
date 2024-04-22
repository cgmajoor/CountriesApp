//
//  CountryResponse.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

struct CountryResponse: Decodable {
    let flags: FlagsResponse
    let name: CountryNameResponse
    let capital: [String]
    let region: String

    func toDomainModel() -> Country {
        return Country(
            name: name.common, 
            flagImageURL: flags.png,
            capital: capital.first ?? "",
            region: region
        )
    }
}
