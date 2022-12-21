import UIKit

@objc protocol JokeDescriptionRoutingLogic {}

protocol JokeDescriptionDataPassing {
  var dataStore: JokeDescriptionDataStore? { get }
}

class JokeDescriptionRouter: NSObject, JokeDescriptionRoutingLogic, JokeDescriptionDataPassing {
  weak var viewController: JokeDescriptionViewController?
  var dataStore: JokeDescriptionDataStore?
}
