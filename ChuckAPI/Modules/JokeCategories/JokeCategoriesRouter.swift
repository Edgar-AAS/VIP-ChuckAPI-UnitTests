import UIKit

protocol JokeCategoriesRoutingLogic {
    func routeToJoke()
}

protocol JokeCategoriesDataPassing {
    var dataStore: JokeCategoriesDataStore? { get }
}

class JokeCategoriesRouter: NSObject, JokeCategoriesRoutingLogic, JokeCategoriesDataPassing {
    weak var viewController: JokeCategoriesViewController?
    var dataStore: JokeCategoriesDataStore?
    
    // MARK: Routing
    func routeToJoke() {
        let destinationVC = JokeDescriptionViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToJokeView(source: dataStore!, destination: &destinationDS)
        navigateToJoke(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    func navigateToJoke(source: JokeCategoriesViewController, destination: JokeDescriptionViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    func passDataToJokeView(source: JokeCategoriesDataStore, destination: inout JokeDescriptionDataStore) {
        destination.category = source.category
    }
}
