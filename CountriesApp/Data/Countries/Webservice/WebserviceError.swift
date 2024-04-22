//
//  WebserviceError.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

enum WebserviceError: String, Error {
    case badURL = "URL couldn't be created"
    case badResponse = "Response is not 200"
    case badJSON = "Response cannot be decoded"
}
