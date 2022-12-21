import XCTest
@testable import ChuckAPI
class JokeCategoriesViewControllerTests: XCTestCase {
    var sut: JokeCategoriesViewController!
    var interactorSpy: JokeCategoriesInteractorSpy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = JokeCategoriesViewController()
        interactorSpy = JokeCategoriesInteractorSpy()
        sut.loadViewIfNeeded()
        sut.interactor = interactorSpy
    }
    
    override func tearDownWithError() throws {
        sut = nil
        interactorSpy = nil
        try super.tearDownWithError()
    }
    
    func test_animalButton_hasAction_assigned() throws {
        // When
        let animalButton: UIButton = sut.homeViewScreen!.animalButton
        guard let animalCategoryButtonAction = animalButton.actions(forTarget: sut.homeViewScreen, forControlEvent: .touchUpInside) else {
            XCTFail("animal button does not have action for event .touchUpInside")
            return
        }
        // Then
        XCTAssertTrue(animalCategoryButtonAction.contains("categorieButtonTappedWithSender:"),
                      "animalButton should trigger categorieButtonTapped: action")
    }
    
    func test_careerButton_hasAction_assigned() throws {
        // When
        let careerButton: UIButton = sut.homeViewScreen!.careerButton
        guard let careerCategoryButtonAction = careerButton.actions(forTarget: sut.homeViewScreen, forControlEvent: .touchUpInside) else {
            XCTFail("career button does not have action for event .touchUpInside")
            return
        }
        // Then
        XCTAssertTrue(careerCategoryButtonAction.contains("categorieButtonTappedWithSender:"),
                      "careerButton should trigger categorieButtonTapped: action")
    }
    
    func test_celebrityButton_hasAction_assigned() throws {
        // When
        let celebrityButton: UIButton = sut.homeViewScreen!.celebrityButton
        guard let celebrityCategoryButtonAction = celebrityButton.actions(forTarget: sut.homeViewScreen, forControlEvent: .touchUpInside) else {
            XCTFail("celebrity button does not have action for event .touchUpInside")
            return
        }
        // Then
        XCTAssertTrue(celebrityCategoryButtonAction.contains("categorieButtonTappedWithSender:"),
                      "celebrityButton should trigger categorieButtonTapped: action")
    }
    
    func test_devButton_hasAction_assigned() throws {
        // When
        let devButton: UIButton = sut.homeViewScreen!.devButton
        guard let devCategoryButtonAction = devButton.actions(forTarget: sut.homeViewScreen, forControlEvent: .touchUpInside) else {
            XCTFail("dev button does not have action for event .touchUpInside")
            return
        }
        // Then
        XCTAssertTrue(devCategoryButtonAction.contains("categorieButtonTappedWithSender:"),
                      "devButton should trigger categorieButtonTapped: action")
    }
    
    func test_animalButtonTapped_shouldCall_getSelectedCategory() {
        // When
        sut.homeViewScreen?.categorieButtonTapped(sender: sut.homeViewScreen!.animalButton)
        // Then
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "animal")
    }
    
    func test_careerButtonTapped_shouldCall_getSelectedCategory() {
        // When
        sut.homeButtonDidTapped(sender: sut.homeViewScreen!.careerButton)
        // Then
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "career")
    }
    
    func test_celebrityButtonButtonTapped_shouldCall_getSelectedCategory() {
        // When
        sut.homeButtonDidTapped(sender: sut.homeViewScreen!.celebrityButton)
        // Then
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "celebrity")
    }
    
    func test_devButtonTapped_shouldCall_getSelectedCategory() {
        // When
        sut.homeButtonDidTapped(sender: sut.homeViewScreen!.devButton)
        // Then
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "dev")
    }
    
    func test_categorieButtonTapped_shouldCall_delegateHomeButtonDidTapped() {
        // Given
        let delegateSpy = JokeHomeViewDelegateSpy()
        let button = UIButton()
        sut.homeViewScreen?.delegate = delegateSpy
        // When
        sut.homeViewScreen?.categorieButtonTapped(sender: button)
        // Then
        XCTAssertTrue(delegateSpy.homeButtonDidTappedCalled)
    }
    
    func test_homeDidTappedPassedAnimalButtonSender() {
        // Given
        let delegateSpy = JokeHomeViewDelegateSpy()
        let animalButton = sut.homeViewScreen?.animalButton
        sut.homeViewScreen?.delegate = delegateSpy
        // When
        sut.homeViewScreen?.categorieButtonTapped(sender: animalButton!)
        // Then
        XCTAssertEqual(animalButton, delegateSpy.senderData)
    }
    
    func test_homeDidTappedPassedCareerButtonSender() {
        // Given
        let delegateSpy = JokeHomeViewDelegateSpy()
        let careerbutton = sut.homeViewScreen?.careerButton
        sut.homeViewScreen?.delegate = delegateSpy
        // When
        sut.homeViewScreen?.categorieButtonTapped(sender: careerbutton!)
        // Then
        XCTAssertEqual(careerbutton, delegateSpy.senderData)
    }
    
    func test_homeDidTappedPassedCelebrityButtonSender() {
        // Given
        let delegateSpy = JokeHomeViewDelegateSpy()
        let celebrityButton = sut.homeViewScreen?.celebrityButton
        sut.homeViewScreen?.delegate = delegateSpy
        // When
        sut.homeViewScreen?.categorieButtonTapped(sender: celebrityButton!)
        // Then
        XCTAssertEqual(celebrityButton, delegateSpy.senderData)
    }
    
    func test_homeDidTappedPassedDevButtonSender() {
        // Given
        let delegateSpy = JokeHomeViewDelegateSpy()
        let devButton = sut.homeViewScreen?.devButton
        sut.homeViewScreen?.delegate = delegateSpy
        // When
        sut.homeViewScreen?.categorieButtonTapped(sender: devButton!)
        // Then
        XCTAssertEqual(devButton, delegateSpy.senderData)
    }
}
