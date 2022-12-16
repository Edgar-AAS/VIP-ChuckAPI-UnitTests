import Foundation
@testable import ChuckAPI

class JokeDescriptionWorkerSpy: JokeDescriptionWorkerProtocol {
    private(set) var fetchRandomJokeCalled = false
    var dataShouldBeReturned: Joke?
    
    func fetchRandomJoke(categorie: String, completion: @escaping (Joke?, Error?) -> Void) {
        fetchRandomJokeCalled = true
        completion(dataShouldBeReturned, nil)
    }
}
