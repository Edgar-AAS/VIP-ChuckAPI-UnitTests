import UIKit

protocol JokeDescriptionPresentationLogic {
    func presentJoke(response: JokeDescription.Response)
}

class JokeDescriptionPresenter: JokeDescriptionPresentationLogic {
    weak var viewController: JokeDescriptionDisplayLogic?
    
    func presentJoke(response: JokeDescription.Response) {
        let viewModel = JokeDescription.ViewModel(joke: response.joke)
        self.viewController?.displayJoke(viewModel: viewModel)
    }
}
