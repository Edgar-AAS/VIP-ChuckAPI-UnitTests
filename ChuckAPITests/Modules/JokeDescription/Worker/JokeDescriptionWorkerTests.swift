import XCTest
@testable import ChuckAPI

class JokeDescriptionWorkerTests: XCTestCase {
    var session = MockURLSession()
    var sut: JokeDescriptionWorker!
    
    func test_fetchRandomJoke_shouldPassCorrectUrl_toDataTask() {
        //Given
        sut = JokeDescriptionWorker(session: session)
        let url = URL(string: "https://api.chucknorris.io/jokes/random?category=animal")
        
        //When
        sut.fetchRandomJoke(categorie: "animal") { (_, _) in }
        
        //Then
        XCTAssertEqual(session.lastURL, url)
    }
    
    func test_fetchRandomJoke_callRequests() {
        //Given
        let dataTaskSpy = MockURLSessionDataTask()
        session.dataTask = dataTaskSpy
        sut = JokeDescriptionWorker(session: session)
        
        //When
        sut.fetchRandomJoke(categorie: "dev") { (_, _) in }

        //Then
        XCTAssert(dataTaskSpy.resumeCalled)
    }
    
    func test_fetchRandomJoke_withResponseData_ReturnsJokeData() {
        //Given
        sut = JokeDescriptionWorker(session: session)
        
        let expectedJoke = Joke(value: Seeds.Jokes.joke2.value)
        let jokeData = expectedJoke.toData()

        session.nextData = jokeData
        
        var actualJoke: Joke?
        
        //When
        sut.fetchRandomJoke(categorie: "animal") { (joke, error) in
            actualJoke = joke
        }
    
        XCTAssertEqual(actualJoke, expectedJoke)
    }
    
    func test_fetchRandomJoke_withNetworkError() {
        sut = JokeDescriptionWorker(session: session)
        session.nextError = NSError(domain: "error", code: 0, userInfo: nil)
        
        var error: Error?
        
        sut.fetchRandomJoke(categorie: "dev") { (_, networkError) in
            error = networkError
        }
        XCTAssertNotNil(error)
    }
}
