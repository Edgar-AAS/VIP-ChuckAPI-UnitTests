import UIKit

protocol JokeDescriptionBusinessLogic {
    func fetchJoke()
}

protocol JokeDescriptionDataStore {
    var category: String { get set }
}

class JokeDescriptionInteractor: JokeDescriptionBusinessLogic, JokeDescriptionDataStore {
    var category: String = ""
    
    private let worker: JokeDescriptionWorkerProtocol
    private let presenter: JokeDescriptionPresentationLogic
    private let mainDispatchQueue: DispatchQueueType
    
    init(
        worker: JokeDescriptionWorkerProtocol = JokeDescriptionWorker(),
        presenter: JokeDescriptionPresentationLogic,
        mainDispatchQueue: DispatchQueueType = DispatchQueue.main
    ) {
        self.worker = worker
        self.presenter = presenter
        self.mainDispatchQueue = mainDispatchQueue
    }
    
    func fetchJoke() {
        worker.fetchRandomJoke(categorie: category, completion: { [weak self] (joke, error) in
            guard let joke = joke?.value else { return }
            
            if let error = error {
                print(error)
            } else {
                self?.mainDispatchQueue.async {
                    let response = JokeDescription.Response(joke: joke)
                    self?.presenter.presentJoke(response: response)
                }
            }
        })
    }       
}
