import UIKit

protocol JokeDescriptionDisplayLogic: class {
    func displayJoke(viewModel: JokeDescription.Fetch.ViewModel)
}

class JokeDescriptionViewController: UIViewController, JokeDescriptionDisplayLogic {
    var interactor: JokeDescriptionBusinessLogic?
    var router: (NSObjectProtocol & JokeDescriptionRoutingLogic & JokeDescriptionDataPassing)?
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.tintColor = .gray
        ai.hidesWhenStopped = true
        ai.startAnimating()
        return ai
    }()
    
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
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicatorView)
        view.backgroundColor = .gray
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadJoke()
    }
    
    @IBOutlet var jokeLabel: UILabel!
    
    func loadJoke() {
        interactor?.fetchJoke()
    }
    
    func displayJoke(viewModel: JokeDescription.Fetch.ViewModel) {
        jokeLabel.text = viewModel.joke
        activityIndicatorView.stopAnimating()
    }
}
