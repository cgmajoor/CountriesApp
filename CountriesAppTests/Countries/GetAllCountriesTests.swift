//
//  GetAllCountriesTests.swift
//  CountriesAppTests
//
//  Created by Ceren Majoor on 22/04/2024.
//

import XCTest
@testable import CountriesApp

final class GetAllCountriesTests: XCTestCase {

    private var mockCountriesWebservice = MockCountriesWebservice()
    private var sut: GetAllCountries!

    override func setUp() {
        sut = GetAllCountries(countriesWebservice: mockCountriesWebservice)
    }

    func test_invokesFetchCountries_When_Calling_Execute() async {
        XCTAssertFalse(mockCountriesWebservice.invokedFetchCountries)

        do {
            _ = try await sut.execute()
            XCTAssertTrue(mockCountriesWebservice.invokedFetchCountries)
        } catch {
            XCTFail("Expected success")
        }
    }

    func test_returnsCorrectResponse_When_CallingExecute_Whilst_WebserviceSucceeds() async {
        mockCountriesWebservice.stubbedResponse = [
            CountryResponse(
                flags: .init(png: "https://flag1.png"),
                name: .init(common: "Turkey"),
                capital: ["Ankara"],
                region: "Asia"
            )
        ]

        do {
            let countries = try await sut.execute()
            XCTAssertEqual(countries.count, 1)
            XCTAssertEqual(countries.first?.name, "Turkey")
            XCTAssertEqual(countries.first?.flagImageURL, "https://flag1.png")
            XCTAssertEqual(countries.first?.capital, "Ankara")
            XCTAssertEqual(countries.first?.region, "Asia")
        } catch {
            XCTFail("Expected to get 1 country")
        }
    }

    func test_returnsCorrectResponse_When_CallingExecute_Whilst_WebserviceFails() async {
        mockCountriesWebservice.stubbedError = WebserviceError.badJSON

        do {
            _ = try await sut.execute()
            XCTFail("Expected WebserviceError")
        } catch let err {
            XCTAssert(err is WebserviceError)
        }
    }
}
