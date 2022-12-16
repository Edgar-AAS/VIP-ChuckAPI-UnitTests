import Foundation
@testable import ChuckAPI

class JokeCategoriesInteractorSpy: JokeCategoriesBusinessLogic, JokeCategoriesDataStore {
    var category: String = ""
    private(set) var getSelectedCategoryCalled = false
    
    func getSelectedCategory(_ selectedCategory: String) {
        category = selectedCategory
        getSelectedCategoryCalled = true
    }
}
