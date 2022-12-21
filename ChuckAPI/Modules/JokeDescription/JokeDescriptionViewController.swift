import UIKit

protocol JokeDescriptionDisplayLogic: class {
    func displayJoke(viewModel: JokeDescription.ViewModel)
}

class JokeDescriptionViewController: UIViewController, JokeDescriptionDisplayLogic {
    var interactor: JokeDescriptionBusinessLogic?
    var router: (NSObjectProtocol & JokeDescriptionRoutingLogic & JokeDescriptionDataPassing)?
    var jokeView: JokeView?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let presenter = JokeDescriptionPresenter()
        let interactor = JokeDescriptionInteractor(presenter: presenter)
        let router = JokeDescriptionRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    override func loadView() {
        super.loadView()
        jokeView = JokeView()
        view = jokeView
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJoke()
    }
    
    func loadJoke() {
        interactor?.fetchJoke()
    }
    
    // Retorno do presenter
    func displayJoke(viewModel: JokeDescription.ViewModel) {
        jokeView?.setupTextLabel(jokeText: viewModel.joke)
    }
}
    
