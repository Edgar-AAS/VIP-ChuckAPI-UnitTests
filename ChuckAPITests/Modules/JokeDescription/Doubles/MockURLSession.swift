import Foundation
@testable import ChuckAPI

class MockURLSession: URLSessionProtocol {
    var lastURL: URL?
    var nextDataTask = MockURLSessionDataTask()
    
    func dataTaskWithURL(url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = url
        return nextDataTask
    }
}
