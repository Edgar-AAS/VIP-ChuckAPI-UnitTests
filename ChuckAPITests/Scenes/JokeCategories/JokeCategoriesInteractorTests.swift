//
//  JokeCategoriesInteractorTests.swift
//  ChuckAPITests
//
//  Created by Leonardo Almeida on 13/12/22.
//

import XCTest
@testable import ChuckAPI
class JokeCategoriesInteractorTests: XCTestCase {
    func test_func_getSelectedCategory_isPassedCategory() {
        let sut = JokeCategoriesInteractor()
        sut.getSelectedCategory("animal")
        XCTAssertEqual(sut.category, "animal")
    }
}
