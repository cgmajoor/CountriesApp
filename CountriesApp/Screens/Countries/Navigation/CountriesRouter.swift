//
//  CountriesRouter.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import Foundation
import UIKit

protocol CountriesRouting {
    func didSelectCountry(in viewController: CountriesViewController, countryName: String)
}

class CountriesRouter: CountriesRouting {
    func didSelectCountry(in viewController: CountriesViewController, countryName: String) {
        let dummyViewController = UIViewController()
        dummyViewController.view.backgroundColor = UIColor.red
        viewController.navigationController?.pushViewController(dummyViewController, animated: true)
    }
}
