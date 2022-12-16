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
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: JokeDescriptionViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: JokeDescriptionDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
