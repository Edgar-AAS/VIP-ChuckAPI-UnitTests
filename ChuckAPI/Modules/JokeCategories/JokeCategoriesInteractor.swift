import UIKit

protocol JokeCategoriesBusinessLogic {
    func getSelectedCategory(_ selectedCategory: String)
}

protocol JokeCategoriesDataStore {
    var category: String { get set }
}

class JokeCategoriesInteractor: JokeCategoriesBusinessLogic, JokeCategoriesDataStore {
    var presenter: JokeCategoriesPresentationLogic?
    var category = ""
    
    func getSelectedCategory(_ selectedCategory: String) {
        category = selectedCategory
    }
}
