import XCTest
@testable import ChuckAPI

class JokeDescriptionViewControllerTests: XCTestCase {
    var sut: JokeDescriptionViewController!
    var interactorSpy: JokeDescriptionInteractorSpy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = JokeDescriptionViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "JokeDescriptionViewController") as? JokeDescriptionViewController
        interactorSpy = JokeDescriptionInteractorSpy()
        sut.interactor = interactorSpy
    }

    override func tearDownWithError() throws {
        sut = nil
        interactorSpy = nil
        try super.tearDownWithError()
    }
    
    func testShouldFetchJokeWhenViewDidLoad() {
        //When
        _ = sut.view
        // Then
        XCTAssert(interactorSpy!.fetchJokeCalled, "Deve buscar a piada quando a exibição é carregada")
    }
    
    func testDisplayJokeShouldReturnCorrectlyFormattedLabel() {
        //when
        _ = sut.view
        sut.displayJoke(viewModel: Seeds.ViewModels.viewModel1)
        //then
        XCTAssertEqual(sut.jokeLabel.text, "Qual é a cidade brasileira que não tem táxi? - Uberlândia.")
    }
}
