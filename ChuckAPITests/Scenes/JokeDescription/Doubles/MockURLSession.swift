import Foundation
@testable import ChuckAPI

final class MockURLSession: URLSessionProtocol {
    var nextDataTask = MockURLSessionDataTask()
    private(set) var lastURL: URL?
    
    func dataTaskWithURL(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = url
        return nextDataTask
    }
}
