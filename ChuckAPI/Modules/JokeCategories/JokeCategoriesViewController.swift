import UIKit

protocol JokeCategoriesDisplayLogic: class { }

class JokeCategoriesViewController: UIViewController, JokeCategoriesDisplayLogic {
    var interactor: JokeCategoriesBusinessLogic?
    var router: (NSObjectProtocol & JokeCategoriesRoutingLogic & JokeCategoriesDataPassing)?
    
    @IBOutlet var animalButton: UIButton!
    @IBOutlet var careerButton: UIButton!
    @IBOutlet var celebrityButton: UIButton!
    @IBOutlet var devButton: UIButton!
    
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
    }
    
    @IBAction func categorieButtonTapped(_ sender: UIButton) {
        switch sender {
        case animalButton:
            interactor?.getSelectedCategory("animal")
        case careerButton:
            interactor?.getSelectedCategory("career")
        case celebrityButton:
            interactor?.getSelectedCategory("celebrity")
        case devButton:
            interactor?.getSelectedCategory("dev")
        default:
            break
        }
        router?.routeToJoke(segue: nil)
    }
}
