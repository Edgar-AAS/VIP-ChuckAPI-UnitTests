import Foundation
@testable import ChuckAPI

class JokeDescriptionViewControllerSpy: JokeDescriptionDisplayLogic {
    private(set) var displayJokeCalled = false
    private(set) var viewModel: JokeDescription.ViewModel?
    
    func displayJoke(viewModel: JokeDescription.ViewModel) {
        displayJokeCalled = true
        self.viewModel = viewModel
    }
}
