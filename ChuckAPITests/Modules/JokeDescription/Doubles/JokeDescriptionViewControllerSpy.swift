
import Foundation
@testable import ChuckAPI

class JokeDescriptionViewControllerSpy: JokeDescriptionDisplayLogic {
    private(set) var displayJokeCalled = false
    private(set) var viewModel: JokeDescription.Fetch.ViewModel?
    
    func displayJoke(viewModel: JokeDescription.Fetch.ViewModel) {
        displayJokeCalled = true
        self.viewModel = viewModel
    }
}
