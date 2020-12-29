//
//  FormWithCoreDataTests.swift
//  FormWithCoreDataTests
//
//  Created on 23/12/20.
//

import XCTest
@testable import FormWithCoreData

class FormWithCoreDataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        checkValidName()
//        checkInValidName()
    }
    
    func checkValidName(){
        let model = GarmentViewModel()
        model.currentGarmentName = "T-shirt"
        XCTAssert(model.isGarmentNameValid())
    }

    func checkInValidName(){
        let model = GarmentViewModel()
        model.currentGarmentName = ""
        XCTAssert(model.isGarmentNameValid())
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
