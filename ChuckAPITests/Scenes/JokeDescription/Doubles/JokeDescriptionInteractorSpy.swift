import Foundation
@testable import ChuckAPI

class JokeDescriptionInteractorSpy: JokeDescriptionBusinessLogic, JokeDescriptionDataStore {
    var category: String = ""
    private(set) var fetchJokeCalled = false
    
    func fetchJoke() {
        fetchJokeCalled = true
    }
}
