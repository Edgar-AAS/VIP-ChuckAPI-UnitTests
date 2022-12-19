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
        let animalButton: UIButton = sut.homeViewScreen!.animalButton
        
        guard let animalCategoryButtonAction = animalButton.actions(forTarget: sut.homeViewScreen, forControlEvent: .touchUpInside) else {
            XCTFail("animal button does not have action for event .touchUpInside")
            return
        }
        
        XCTAssertTrue(animalCategoryButtonAction.contains("categorieButtonTappedWithSender:"), "animalButton should trigger categorieButtonTapped: action")
    }
    
    func test_careerButton_hasAction_assigned() throws {
        let careerButton: UIButton = sut.homeViewScreen!.careerButton
        guard let careerCategoryButtonAction = careerButton.actions(forTarget: sut.homeViewScreen, forControlEvent: .touchUpInside) else {
            XCTFail("career button does not have action for event .touchUpInside")
            return
        }
        
        XCTAssertTrue(careerCategoryButtonAction.contains("categorieButtonTappedWithSender:"), "careerButton should trigger categorieButtonTapped: action")
    }
    
    func test_celebrityButton_hasAction_assigned() throws {
        let celebrityButton: UIButton = sut.homeViewScreen!.celebrityButton
        guard let celebrityCategoryButtonAction = celebrityButton.actions(forTarget: sut.homeViewScreen, forControlEvent: .touchUpInside) else {
            XCTFail("celebrity button does not have action for event .touchUpInside")
            return
        }
        XCTAssertTrue(celebrityCategoryButtonAction.contains("categorieButtonTappedWithSender:"), "celebrityButton should trigger categorieButtonTapped: action")
    }
    
    func test_devButton_hasAction_assigned() throws {
        let devButton: UIButton = sut.homeViewScreen!.devButton
        guard let devCategoryButtonAction = devButton.actions(forTarget: sut.homeViewScreen, forControlEvent: .touchUpInside) else {
            XCTFail("dev button does not have action for event .touchUpInside")
            return
        }
        XCTAssertTrue(devCategoryButtonAction.contains("categorieButtonTappedWithSender:"), "devButton should trigger categorieButtonTapped: action")
    }
    
    func test_animalButtonTapped_shouldCall_getSelectedCategory() {
        sut.homeViewScreen?.categorieButtonTapped(sender: sut.homeViewScreen!.animalButton)
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "animal")
    }
    
    func test_careerButtonTapped_shouldCall_getSelectedCategory() {
        sut.homeButtonDidTapped(sender: sut.homeViewScreen!.careerButton)
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "career")
    }
    
    func test_celebrityButtonButtonTapped_shouldCall_getSelectedCategory() {
        sut.homeButtonDidTapped(sender: sut.homeViewScreen!.celebrityButton)
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "celebrity")
    }
    
    func test_devButtonTapped_shouldCall_getSelectedCategory() {
        sut.homeButtonDidTapped(sender: sut.homeViewScreen!.devButton)
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "dev")
    }
}

