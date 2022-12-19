import UIKit
@testable import ChuckAPI

class JokeHomeViewDelegateSpy: JokeHomeViewDelegate {
    private(set) var homeButtonDidTappedCalled = false
    var senderData: UIButton?
    
    func homeButtonDidTapped(sender: UIButton) {
        homeButtonDidTappedCalled = true
        senderData = sender
    }
}
