import UIKit

enum NetworkError: Error {
    case badURL
    case invalidResponse
    case invalidData
    case decodeError(String)
}

protocol JokeDescriptionWorkerProtocol {
    func fetchRandomJoke(categorie: String, completion: @escaping (Joke?, Error?) -> Void)
}

class JokeDescriptionWorker: JokeDescriptionWorkerProtocol {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    // Criar views para testar o erro respectivo
    func fetchRandomJoke(categorie: String, completion: @escaping (Joke?, Error?) -> Void) {
        let baseURl = "https://api.chucknorris.io/jokes/random?category="
        
        guard let url = URL(string: baseURl + categorie)  else {
            completion(nil, NetworkError.badURL)
            return
        }
        
        session.dataTaskWithURL(url: url) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                completion(nil, NetworkError.invalidResponse)
                return
            }
            
            if 200...299 ~= response.statusCode {
                guard let jsonData = data else {
                    completion(nil, NetworkError.invalidData)
                    return
                }
                
                do {
                    let randomJoke = try JSONDecoder().decode(Joke.self, from: jsonData)
                    completion(randomJoke, nil)
                } catch {
                    completion(nil, NetworkError.decodeError(error.localizedDescription))
                }
            }
        }.resume()
    }
}
