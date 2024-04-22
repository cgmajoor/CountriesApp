//
//  CountryDetailViewModelProtocol.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

protocol CountryDetailViewModelProtocol {
    var onStateChanged: ((State) -> ())? { get set }
    var country: CountryItem? { get }
    func loadCountry()
}
