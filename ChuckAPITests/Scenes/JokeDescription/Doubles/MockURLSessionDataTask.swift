import Foundation
@testable import ChuckAPI

final class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private(set) var resumeCalled = false
    
    func resume() {
        resumeCalled = true
    }
}
