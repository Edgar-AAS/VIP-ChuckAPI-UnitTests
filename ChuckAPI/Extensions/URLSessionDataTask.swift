//
//  URLSessionDataTask.swift
//  ChuckAPI
//
//  Created by Leonardo Almeida on 16/12/22.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

//nao pede para implementar o protocol, pois a nomenclatura é a mesma do metodo interno
extension URLSessionDataTask: URLSessionDataTaskProtocol {}
