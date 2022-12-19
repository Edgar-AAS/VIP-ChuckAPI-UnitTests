import UIKit

protocol JokeCategoriesDisplayLogic: class {}

class JokeCategoriesViewController: UIViewController, JokeCategoriesDisplayLogic {
    var interactor: JokeCategoriesBusinessLogic?
    var router: (NSObjectProtocol & JokeCategoriesRoutingLogic & JokeCategoriesDataPassing)?
    var homeViewScreen: JokeHomeView?
    
    override func loadView() {
        super.loadView()
        homeViewScreen = JokeHomeView()
        homeViewScreen?.delegate = self
        view = homeViewScreen
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = JokeCategoriesInteractor()
        let presenter = JokeCategoriesPresenter()
        let router = JokeCategoriesRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension JokeCategoriesViewController: JokeHomeViewDelegate {
    func homeButtonDidTapped(sender: UIButton) {
        switch sender {
            case homeViewScreen?.animalButton:
                interactor?.getSelectedCategory("animal")
            case homeViewScreen?.careerButton:
                interactor?.getSelectedCategory("career")
            case homeViewScreen?.celebrityButton:
                interactor?.getSelectedCategory("celebrity")
            case homeViewScreen?.devButton:
                interactor?.getSelectedCategory("dev")
            default:
                return
        }
        router?.routeToJoke()
    }
}
