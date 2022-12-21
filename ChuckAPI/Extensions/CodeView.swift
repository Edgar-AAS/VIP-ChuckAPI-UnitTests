//
//  CodeView.swift
//  RickAndMortyAPI
//
//  Created by Edgar Arlindo on 31/07/22.
//

// Templete Method
import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func setupConstrains()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstrains()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {}
}
