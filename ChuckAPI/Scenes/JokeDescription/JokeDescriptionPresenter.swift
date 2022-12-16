import UIKit

protocol JokeDescriptionPresentationLogic {
    func presentJoke(response: JokeDescription.Fetch.Response)
}

class JokeDescriptionPresenter: JokeDescriptionPresentationLogic {
    weak var viewController: JokeDescriptionDisplayLogic?
    
    // MARK: Do something
    func presentJoke(response: JokeDescription.Fetch.Response) {
        let viewModel = JokeDescription.Fetch.ViewModel(joke: response.joke)
        self.viewController?.displayJoke(viewModel: viewModel)
    }
}
