//
//  CountriesViewModelTests.swift
//  CountriesAppTests
//
//  Created by Ceren Majoor on 22/04/2024.
//


import XCTest
@testable import CountriesApp

final class CountriesViewModelTests: XCTestCase {
    
    private var mockGetAllCountries = MockGetAllCountries()
    private var sut: CountriesViewModel!
    
    override func setUp() {
        sut = CountriesViewModel(getAllCountries: mockGetAllCountries)
    }
    
    func test_invokesExecute_When_CallingLoadCountries () {
        XCTAssertFalse(mockGetAllCountries.invokedExecute)
        
        let expectation = XCTestExpectation(description: "Expected to invoke execute")
        
        sut.loadCountries()
        
        DispatchQueue.main.async {
            XCTAssertTrue(self.mockGetAllCountries.invokedExecute)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_returnsCorrectResult_When_CallingLoadCountries_Whilst_GetAllCountriesSucceeds()  {
        mockGetAllCountries.stubbedResult = [
            .init(name: "America", flagImageURL: "https://flag2.png", capital: "Washington, D.C.", region: "Americas")
        ]
        
        let expectation = XCTestExpectation(description: "Expected to load countries successfully")
        
        DispatchQueue.main.async {
            XCTAssertEqual(self.sut.countries.count, 1)
            XCTAssertEqual(self.sut.countries.first?.name, "America")
            XCTAssertEqual(self.sut.countries.first?.flagImageURL, "https://flag2.png")
            XCTAssertEqual(self.sut.countries.first?.capital, "Washington, D.C.")
            XCTAssertEqual(self.sut.countries.first?.region, "Americas")
            expectation.fulfill()
        }
        
        sut.loadCountries()
        
        wait(for: [expectation], timeout: 1.0)
    }
}
