//
//  Seeds.swift
//  ChuckAPITests
//
//  Created by Leonardo Almeida on 15/12/22.
//

import Foundation
@testable import ChuckAPI

struct Seeds {
    struct Jokes {
        static let joke1 = Joke(value: "O que é um pontinho azul no céu? - Uma Bluebuleta")
        static let joke2 = Joke(value: "O que o lápis disse para o papel? - Você está me desapontando")
    }
    
    struct Responses {
        static let response1 = JokeDescription.Fetch.Response(joke: "O que é um pontinho amarelo na piscina? - O César Cyellow.")
    }
    
    struct ViewModels {
        static let viewModel1 = JokeDescription.Fetch.ViewModel(joke: "Qual é a cidade brasileira que não tem táxi? - Uberlândia.")
    }
}
