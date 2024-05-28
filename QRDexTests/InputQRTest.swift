//
//  InputQRTest.swift
//  QRDexTests
//
//  Created by Nattapong Kueakool on 28/5/2567 BE.
//

import XCTest
@testable import QRDex

final class InputQRTest: XCTestCase {
    
    var sut: InputQrViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = InputQrViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testTelNumberMoreThan10_validateTel_displayErrorMoreThan10Number() throws {
        let telNumberMoreThan10 = "098-123-456789"
        let error = sut.validTelFormat(tel: telNumberMoreThan10)
        XCTAssertEqual(error, InputTelQrError.Not10Digit)
    }
    
    func testTelNumberEqual10_validateTel_notErrorFromValidateFunction() throws {
        let telNumberMoreThan10 = "098-123-4589"
        let error = sut.validTelFormat(tel: telNumberMoreThan10)
        XCTAssertNil(error)
    }
    
    func testFirstNumberIs0_validateTel_displayErrorFirstNumber() throws {
        let telNumberMoreThan10 = "198-123-4567"
        let error = sut.validTelFormat(tel: telNumberMoreThan10)
        XCTAssertEqual(error, InputTelQrError.FirstCharactorIsNotZero)
    }
    
    func testOrderingNumber_validateTel_displayErrorOrdering() throws{
        let telNumberMoreThan10 = "012-345-6789"
        let error = sut.validTelFormat(tel: telNumberMoreThan10)
        XCTAssertEqual(error, InputTelQrError.OrderingNumber)
    }
    
    func testSameNumber_validateTel_displayErrorSameNumber() throws{
        let telNumberMoreThan10 = "011-111-1111"
        let error = sut.validTelFormat(tel: telNumberMoreThan10)
        XCTAssertEqual(error, InputTelQrError.AllSingleNumber)
    }
    
    func testMoneyAmountLeastThanOrEqual5000_validateAmount_notErrorFromValidateFunction() throws{
        let amount = "5000"
        let error = sut.validAmount(amt: amount)
        XCTAssertNil(error)
    }
    
    func testMoneyAmountMoreThan5000_validateAmount_displayErrorOverLimit() throws{
        let amount = "5001"
        let error = sut.validAmount(amt: amount)
        XCTAssertEqual(error,InputAmtQrError.OverLimit)
    }

}
