import UIKit

@objc protocol JokeDescriptionRoutingLogic {
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol JokeDescriptionDataPassing {
  var dataStore: JokeDescriptionDataStore? { get }
}

class JokeDescriptionRouter: NSObject, JokeDescriptionRoutingLogic, JokeDescriptionDataPassing {
  weak var viewController: JokeDescriptionViewController?
  var dataStore: JokeDescriptionDataStore?
}
