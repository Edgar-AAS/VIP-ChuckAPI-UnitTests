//
//  JokeCategoriesViewControllerTests.swift
//  ChuckAPITests
//
//  Created by Leonardo Almeida on 13/12/22.
//

import XCTest
@testable import ChuckAPI
class JokeCategoriesViewControllerTests: XCTestCase {
    var sut: JokeCategoriesViewController!
    var interactorSpy: JokeCategoriesInteractorSpy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = JokeCategoriesViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "JokeCategoriesViewController") as? JokeCategoriesViewController
        interactorSpy = JokeCategoriesInteractorSpy()
        sut.interactor = interactorSpy
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        interactorSpy = nil
        try super.tearDownWithError()
    }
    
    func test_animalButton_hasAction_assigned() throws {
        let animalCategoryButton: UIButton = sut.animalButton
        guard let animalCategoryButtonAction = animalCategoryButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("animal button does not have action for event .touchUpInside")
            return
        }
        XCTAssertTrue(animalCategoryButtonAction.contains("categorieButtonTapped:"),
                      "animalButton should trigger categorieButtonTapped: action")
    }
    
    func test_careerButton_hasAction_assigned() throws {
        let careerCategoryButton: UIButton = sut.careerButton
        guard let careerCategoryButtonAction = careerCategoryButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("career button does not have action for event .touchUpInside")
            return
        }
        XCTAssertTrue(careerCategoryButtonAction.contains("categorieButtonTapped:"),
                      "careerButton should trigger categorieButtonTapped: action")
    }
    
    func test_celebrityButton_hasAction_assigned() throws {
        let celebrityCategoryButton: UIButton = sut.celebrityButton
        guard let celebrityCategoryButtonAction = celebrityCategoryButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("celebrity button does not have action for event .touchUpInside")
            return
        }
        XCTAssertTrue(celebrityCategoryButtonAction.contains("categorieButtonTapped:"), "celebrityButton should trigger categorieButtonTapped: action")
    }
    
    func test_devButton_hasAction_assigned() throws {
        let devCategoryButton: UIButton = sut.devButton
        guard let devCategoryButtonAction = devCategoryButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("dev button does not have action for event .touchUpInside")
            return
        }
        XCTAssertTrue(devCategoryButtonAction.contains("categorieButtonTapped:"),
                      "devButton should trigger categorieButtonTapped: action")
    }
    
    func test_animalButtonTapped_shouldCall_getSelectedCategory() {
        sut.categorieButtonTapped(sut.animalButton)
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "animal")
    }
    
    func test_careerButtonTapped_shouldCall_getSelectedCategory() {
        sut.categorieButtonTapped(sut.careerButton)
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "career")
    }
    
    func test_celebrityButtonButtonTapped_shouldCall_getSelectedCategory() {
        sut.categorieButtonTapped(sut.celebrityButton)
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "celebrity")
    }
    
    func test_devButtonTapped_shouldCall_getSelectedCategory() {
        sut.categorieButtonTapped(sut.devButton)
        XCTAssertTrue(interactorSpy.getSelectedCategoryCalled)
        XCTAssertEqual(interactorSpy.category, "dev")
    }
}

