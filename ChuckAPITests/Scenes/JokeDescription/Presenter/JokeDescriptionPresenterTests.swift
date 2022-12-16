import XCTest
@testable import ChuckAPI

class JokeDescriptionPresenterTests: XCTestCase {
    func testDisplayJokeCalledByPresenter() {
        //given
        let sut = JokeDescriptionPresenter()
        let jokeViewControllerSpy = JokeDescriptionViewControllerSpy()
        sut.viewController = jokeViewControllerSpy
        
        //when
        sut.presentJoke(response: Seeds.Responses.response1)
        
        //then
        XCTAssert(jokeViewControllerSpy.displayJokeCalled)
    }
    
    func testPresentJokeShouldFormatJokeForDisplay() {
        //given
        let viewControllerSpy = JokeDescriptionViewControllerSpy()
        let sut = JokeDescriptionPresenter()
        sut.viewController = viewControllerSpy
        
        //when
        sut.presentJoke(response: Seeds.Responses.response1)
        
        //then
        XCTAssertEqual(Seeds.Responses.response1.joke, viewControllerSpy.viewModel?.joke, "presentJoke() deve pedir ao view controller para exibir a mesma joke que recebe")
    }
}
