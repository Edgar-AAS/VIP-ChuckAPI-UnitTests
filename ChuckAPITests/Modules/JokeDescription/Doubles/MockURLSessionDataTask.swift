import Foundation
@testable import ChuckAPI

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private(set) var resumeCalled = false
    
    func resume() {
        resumeCalled = true
    }
}
