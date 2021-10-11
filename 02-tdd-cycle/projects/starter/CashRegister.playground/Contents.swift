/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import XCTest


class CashRegister {
    
    // MARK: - Properties
        
    var availableFunds: Decimal  // 使用可能金額
    var transactionTotal: Decimal = 0  // 取引
    
    // MARK: - Lifecycle
        
    init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }
        
    // MARK: - Helpers
    
    func addItem(_ cost: Decimal) {
        transactionTotal += cost
    }
    
    func acceptCashPayment(_ payment: Decimal) {
        transactionTotal -= payment
        availableFunds += payment
    }
    
}


class CashRegisterTests: XCTestCase {
    
    var availableFunds: Decimal!
    var itemCost: Decimal!
    var payment: Decimal!
    
    var sut: CashRegister!
    
    override func setUp() {
        super.setUp()
        availableFunds = 100
        itemCost = 42
        payment = 40
        // sut: system under test
        sut = CashRegister(availableFunds: availableFunds)
    }
    
    override func tearDown() {
        super.tearDown()
        // テスト中は同じインスタンスが使われるのでsetUp()で代入した値を必ずnilにすること
        availableFunds = nil
        itemCost = nil
        payment = nil
        sut = nil
    }
    
    // test*という名称にする
    func testInitAvailableFunds_setsAvailableFunds() {
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
    
    func testAddItem_oneItem_addCostToTransactionTotal() {
        sut.addItem(itemCost)
        
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    
    func testAddItem_twoItems_addsCostsToTransactionTotal() {
        let itemCost2 = Decimal(20)
        let expectedTotal = itemCost + itemCost2
        
        sut.addItem(itemCost)
        sut.addItem(itemCost2)
        
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }
    
    // MARK: - Challenge
    
    func testAcceptCashPayment_subtractsPaymentFromTransactionTotal() {
        givenTransactionInProgress()
        let expected = sut.transactionTotal - payment
        
        sut.acceptCashPayment(payment)
        
        XCTAssertEqual(sut.transactionTotal, expected)
    }
    
    func testAcceptCashPayment_addsPaymentToAvailableFunds() {
        givenTransactionInProgress()
        let expected = sut.availableFunds + payment
        
        sut.acceptCashPayment(payment)
        
        XCTAssertEqual(sut.availableFunds, expected)
    }
    
    func givenTransactionInProgress() {
        sut.addItem(50)
        sut.addItem(100)
    }
}

CashRegisterTests.defaultTestSuite.run()
