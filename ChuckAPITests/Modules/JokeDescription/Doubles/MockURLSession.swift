import Foundation
@testable import ChuckAPI

class MockURLSession: URLSessionProtocol {
    private(set) var lastURL: URL?
    
    var nextData: Data?
    var nextError: Error?
    var response: HTTPURLResponse?
    var dataTask: URLSessionDataTaskProtocol = MockURLSessionDataTask()
    
    //na implementacao original da apple o completion handler e chamado como retorno de uma requisicao
    //no entanto, alteramos esse completion para retornar os dados Mockados bem como o dataTask.
    
    func dataTaskWithURL(url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = url
        response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        completionHandler(nextData, response, nextError)
        return dataTask
    }
}
