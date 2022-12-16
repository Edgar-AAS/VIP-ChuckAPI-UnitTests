import UIKit

enum JokeDescription {
    enum Fetch {
        struct Request: Equatable {
            let jokeCategory: String
        }
        struct Response: Equatable {
            let joke: String
        }
        struct ViewModel: Equatable {
            let joke: String
        }
    }
}
