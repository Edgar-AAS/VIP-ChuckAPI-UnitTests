import UIKit

@objc protocol JokeCategoriesRoutingLogic {
    func routeToJoke(segue: UIStoryboardSegue?)
}

protocol JokeCategoriesDataPassing {
    var dataStore: JokeCategoriesDataStore? { get }
}

class JokeCategoriesRouter: NSObject, JokeCategoriesRoutingLogic, JokeCategoriesDataPassing {
    weak var viewController: JokeCategoriesViewController?
    var dataStore: JokeCategoriesDataStore?
    
    // MARK: Routing
    func routeToJoke(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! JokeDescriptionViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToJokeView(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "JokeDescriptionViewController") as! JokeDescriptionViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToJokeView(source: dataStore!, destination: &destinationDS)
            navigateToJoke(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    func navigateToJoke(source: JokeCategoriesViewController, destination: JokeDescriptionViewController) {
        source.show(destination, sender: nil)
    }
    
    //   MARK: Passing data
    func passDataToJokeView(source: JokeCategoriesDataStore, destination: inout JokeDescriptionDataStore) {
        destination.category = source.category
    }
}
