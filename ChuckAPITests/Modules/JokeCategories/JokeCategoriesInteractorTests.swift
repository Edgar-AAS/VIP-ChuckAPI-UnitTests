import XCTest
@testable import ChuckAPI

class JokeCategoriesInteractorTests: XCTestCase {
    func test_func_getSelectedCategory_isPassedCategory() {
        let sut = JokeCategoriesInteractor()
        sut.getSelectedCategory("animal")
        XCTAssertEqual(sut.category, "animal")
    }
}
