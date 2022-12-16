import XCTest
@testable import ChuckAPI

class JokeDescriptionWorkerTests: XCTestCase {
    var urlSessionMock = MockURLSession()
    var sut: JokeDescriptionWorker!
    
    func test_fetchRandomJoke_shouldPassCorrectUrl_toDataTask() {
        //Given
        sut = JokeDescriptionWorker(session: urlSessionMock)
        let url = URL(string: "https://api.chucknorris.io/jokes/random?category=animal")
        
        //When
        sut.fetchRandomJoke(categorie: "animal") { (_, _) in }
        
        //Then
        XCTAssertEqual(urlSessionMock.lastURL, url)
    }
    
    func test_fetchRandomJoke_callRequests() {
        //Given
        sut = JokeDescriptionWorker(session: urlSessionMock)
        
        //When
        let dataTask = MockURLSessionDataTask()
        urlSessionMock.nextDataTask = dataTask
        sut.fetchRandomJoke(categorie: "dev") { (_, _) in }
        
        //Then
        XCTAssert(dataTask.resumeCalled, "O método resume() deve ser chamado para iniciar a task")
    }
}
