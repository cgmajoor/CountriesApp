//
//  CountriesViewModelProtocol.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

protocol CountriesViewModelProtocol {
    var onStateChanged: ((State) -> ())? { get set }
    var countries: [Country] { get }

    func loadCountries()
}
