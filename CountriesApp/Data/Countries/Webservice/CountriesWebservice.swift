//
//  CountriesWebservice.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation

class CountriesWebservice {
    let urlString = "https://restcountries.com/v3.1/all?fields=flags,name,capital,region"
    
    func fetchCountries() async throws -> [Country] {
        guard let url = URL(string: urlString) else {
            print("Bad URL")
            throw WebserviceError.badURL
        }
        
        async let (data, response) = try await URLSession.shared.data(from: url)
        
        guard
            let resp = try await response as? HTTPURLResponse,
            resp.statusCode == 200 else {
            throw WebserviceError.badResponse
        }
        
        do {
            return try await JSONDecoder().decode([Country].self, from: data)
        } catch {
            throw WebserviceError.badJSON
        }
    }
}