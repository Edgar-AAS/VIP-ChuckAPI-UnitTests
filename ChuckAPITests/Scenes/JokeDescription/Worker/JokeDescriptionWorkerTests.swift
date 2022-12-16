import XCTest
@testable import ChuckAPI

class JokeDescriptionWorkerTests: XCTestCase {
    //testando se a URL recebida é a mesma que foi passada pelo dataTask
    //preservando a integridade da URL
    
    let mockUrlSession = MockURLSession()
    lazy var sut = JokeDescriptionWorker(session: mockUrlSession)
        
    func test_fetchRandomJoke_RequestsTheURL() {
        //given
        let url = URL(string: "https://api.chucknorris.io/jokes/random?category=animal")!
        //when
        sut.fetchRandomJoke(categorie: "animal") { (_, _) in }
        //then
        XCTAssertEqual(mockUrlSession.lastURL, url, "A url recebida deve ser igual a criada")
    }
    
    func  test_fetchRandomJoke_StartsTheRequest() {
        //given
        let dataTask = MockURLSessionDataTask()
        mockUrlSession.nextDataTask = dataTask
        //when
        sut.fetchRandomJoke(categorie: "dev") { (_, _) in }
        //then
        XCTAssert(dataTask.resumeCalled, "O método resume() deve ser chamado para iniciar a task")
    }
}
