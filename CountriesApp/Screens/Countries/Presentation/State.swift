//
//  State.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

enum State {
    case loading
    case error(WebserviceError)
    case success
}
