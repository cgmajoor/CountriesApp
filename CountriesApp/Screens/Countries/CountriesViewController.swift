//
//  CountriesViewController.swift
//  CountriesApp
//
//  Created by Ceren Majoor on 22/04/2024.
//

import UIKit

class CountriesViewController: UIViewController {
    
    private var viewModel: CountriesViewModel
    
    init(viewModel: CountriesViewModel = CountriesViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.loadCountries()
    }
}
