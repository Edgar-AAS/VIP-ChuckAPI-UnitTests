
import XCTest
@testable import ChuckAPI

class JokeDescriptionInteractorTests: XCTestCase {
    func testFetchJokeCallsWorkerToFetch() {
        //given
        let jokeWorkerSpy = JokeDescriptionWorkerSpy()
        let jokePresenterSpy = JokePresenterSpy()
        let sut = JokeDescriptionInteractor(worker: jokeWorkerSpy, presenter: jokePresenterSpy)
        //when
        sut.fetchJoke()
        //Then
        XCTAssert(jokeWorkerSpy.fetchRandomJokeCalled, "fetchJoke() should ask the worker to fetch random joke")
    }
    
    func testFetchJokeCallsPresenterToFormatJoke() {
        //given
        let jokeWorkerSpy = JokeDescriptionWorkerSpy()
        let jokePresenterSpy = JokePresenterSpy()
        jokeWorkerSpy.dataShouldBeReturned = Seeds.Jokes.joke1
        let sut = JokeDescriptionInteractor(worker: jokeWorkerSpy, presenter: jokePresenterSpy, mainDispatchQueue: DispatchQueueMock())
        //when
        sut.fetchJoke()
        //Then
        XCTAssert(jokePresenterSpy.presentJokeCalled, "O método fetchJoke() do interactor deve chamar o método presentJoke() do presenter")
    }
    
    func testFetchJokePassValidDataToPresenter() {
        //given
        let jokeWorkerSpy = JokeDescriptionWorkerSpy()
        let jokePresenterSpy = JokePresenterSpy()
        jokeWorkerSpy.dataShouldBeReturned = Seeds.Jokes.joke2
        let sut = JokeDescriptionInteractor(worker: jokeWorkerSpy, presenter: jokePresenterSpy, mainDispatchQueue: DispatchQueueMock())
        //when
        sut.fetchJoke()
        //Then
        //teste com possiblidade de falso positivo <- (Arrumar)
        XCTAssertEqual(jokePresenterSpy.joke, Seeds.Jokes.joke2.value, "O valor de joke deve ser igual a resposta de JokeDescriptionWorker")
    }
}
