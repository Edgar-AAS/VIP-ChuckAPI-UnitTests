import Foundation
@testable import ChuckAPI

class JokePresenterSpy: JokeDescriptionPresentationLogic {
    private(set) var presentJokeCalled = false
    
    var joke: String?
    
    func presentJoke(response: JokeDescription.Fetch.Response) {
        presentJokeCalled = true
        self.joke = response.joke
    }
}
