//
//  Exitek_iOS_Developer_Tech_Task__RAM_Tests.swift
//  Exitek iOS Developer Tech Task (RAM)Tests
//
//  Created by Дмитрий Скворцов on 06.09.2022.
//

import XCTest
@testable import Exitek_iOS_Developer_Tech_Task__RAM_

class Exitek_iOS_Developer_Tech_Task__RAM_Tests: XCTestCase {
    var mobilePhone: MobilePhone!
    var testMobile: Mobile?

    override func setUpWithError() throws {
        mobilePhone = MobilePhone()
        testMobile = Mobile(imei: "123456789012345", model: "Test Model")
    }

    override func tearDownWithError() throws {
        mobilePhone = nil
        testMobile = nil
    }

    func testLocalStorageSetNotEmpty() throws {
        let expectedResult = true
        var result: Bool

        if LocalStorage.shared.mobilesStorageSet == [] {
            result = false
        } else {
            result = true
        }

        XCTAssertEqual(expectedResult, result)
    }

    func testMobileGetAllFunc() {
        var result: Bool

        if ((mobilePhone?.getAll()) != nil) {
            result = true
        } else {
            result = false
        }

        XCTAssertTrue(result)
    }


    func testMobileFindByImeiFunc() {
        var result: Mobile?
        var expectedResult: Bool

        result = mobilePhone.findByImei(LocalStorage.shared.mobilesStorageSet.first!.imei)!

        switch result {
        case nil:
            expectedResult = false
        default:
            expectedResult = true
        }

        XCTAssertTrue(expectedResult, "the func returns nil")
        result = nil
    }

    func testMobileSaveFunc() {
        var result: Mobile?
        var expectedResult: Bool

        if let testMobile = testMobile {
            result = try? mobilePhone.save(testMobile)
        }

        switch result {
        case nil:
            expectedResult = false
        default:
            expectedResult = true
        }

        XCTAssertTrue(expectedResult)
        result = nil
    }

    func testMobileDeleteFunc() {
        if let testMobile = testMobile {
            try? mobilePhone.delete(testMobile)
        }
    }

    func testExistsMobileFunc() {
        var resultTrue = true
        var resultFalse = false

        resultTrue = mobilePhone.exists(LocalStorage.shared.mobilesStorageSet.first!)
        if let testMobile = testMobile {
            resultFalse = mobilePhone.exists(testMobile)
        }

        XCTAssertNotEqual(resultTrue, resultFalse)
    }

    func testPerformanceExample() throws {

        measure {

        }
    }
}
